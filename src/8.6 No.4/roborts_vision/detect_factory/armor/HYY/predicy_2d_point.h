#pragma once 

#include<iostream>
#include<opencv2/opencv.hpp>
#include "opencv2/video/tracking.hpp"
#include "opencv2/highgui.hpp"
#include <vector>

#include <ros/ros.h>
#include <math.h>

#include <stdio.h>

#include "predict_count.h"

namespace predict_2d_point
{
    //angle
    float yaw;
    float his_yaw;
    float pitch;
    float his_pitch;

    //speed
    int yaw_vel;
    int pitch_vel;
    int Vx;
    int Vy;
    int Vx_after_fliter;
    int Vy_after_fliter;
    // float ;

    //2D points
    cv::Point2l old_2d_point;
    cv::Point2l new_2d_point;
    cv::Point2l predict_2d_point;
    cv::Point2l temp_new_2d_point;
    cv::Point2l temp_old_2d_point;

    //vel fliter
    std::vector<float> vels_(5);
    std::vector<float> vels_copy(5);

    int temp_vel;
    int his_vel_x;
    int loop_cnt = 0;
    int max_vel_x = 0;
    int min_vel_x = 100000;
    int op_max_vel_x = 0;
    int op_min_vel_x = -100000;
    int his_max_vel_x = 0;
    int his_min_vel_x = 0;
    int old_his_vel_x = 0;

    bool vel_comp(const float &a, const float &b)
    {
        return abs(a) > abs(b);
    }

    void angle_speed_calculat(float yaw_)
    {
        yaw_vel = yaw_ - his_yaw;
    }

    int armor_speed_calculat(cv::RotatedRect armor)
    {
        new_2d_point = armor.center;
        Vx = new_2d_point.x - old_2d_point.x;
        
        ROS_ERROR("new: %d , old: %d ， V: %d", new_2d_point.x , old_2d_point.x, Vx);
        return Vx;
    }

    void reset_vel_fliter()
    {
        max_vel_x = 0;
        min_vel_x = 100000;
        op_max_vel_x = 0;
        op_min_vel_x = -100000;
        his_max_vel_x = 0;
        his_min_vel_x = 0;
        old_his_vel_x = 0;
    }

    int vel_fliter(int vel)
    {
        if(predict_count::predict_count > 4)    
            reset_vel_fliter();
        

        vels_[0] = vels_[1];
        vels_[1] = vels_[2];
        vels_[2] = vels_[3];
        vels_[3] = vels_[4];
        vels_[4] = vel;

        vels_copy = vels_;
        sort(vels_copy.begin(), vels_copy.end(), vel_comp);

        if ( vels_[3] >= 0 && vels_[2] >= 0)
        {
            temp_vel = vels_copy[2];
        }
        else if(vels_[3] < 0 && vels_[2] < 0)
        {
            temp_vel = vels_copy[2];
        }
        else if (vels_[3] >= 0 && vels_[2] < 0)
        {
            temp_vel = vels_[2];
        }
        else if (vels_[3] < 0 && vels_[2] >= 0)
        {
            temp_vel = vels_[2];
        }
        else
        {
            ROS_ERROR("wtf ?");
        }

        int vel_x = temp_vel;

        //feng zhi bao chi
        if(temp_vel > 0 && (temp_vel - his_vel_x) > -100) //jia su du a>0 su du v>0
        {
            if(temp_vel > max_vel_x )
            {
                max_vel_x = temp_vel;
            }
        }
        if(temp_vel > 0 && (temp_vel - his_vel_x) < 100) //jia su du a<0 su du v>0
        {
            if(temp_vel < min_vel_x)
            {
                min_vel_x = temp_vel;
            }
        }
        if(temp_vel < 0 && (temp_vel - his_vel_x) < 100) //jia su du a>0 su du v<0
        {
            if(temp_vel < op_max_vel_x )
            {
                op_max_vel_x = temp_vel;
            }
        }
        if(temp_vel < 0 && (temp_vel - his_vel_x) > -100) //jia su du a<0 su du v<0
        {
          if(temp_vel > op_min_vel_x)
          {
            op_min_vel_x = temp_vel;
          }
        } 
        
        if ( vel_x > 50 && (vel_x - his_vel_x) > -50 /*vel_x > 2*/)  //a>0, v>0
        {
          vel_x = max_vel_x;
          his_max_vel_x = vel_x;
        }
        else if ( vel_x > 50 && (vel_x - his_vel_x) < 50)           //a<0, v>0
        {
          vel_x = min_vel_x;
          his_min_vel_x = vel_x;
        }
        else if (vel_x < -50 && (vel_x - his_vel_x) < 50 /*vel_x < -2*/)  //a>0, v<0
        {
          vel_x = op_max_vel_x;
          his_max_vel_x = vel_x;
        }
        else if (vel_x < -50 && (vel_x - his_vel_x) > -50)             //a<0, v<0
        {
          vel_x = op_min_vel_x;
          his_min_vel_x = vel_x;
        }
        else
        {
          // vel_x = his_min_vel_x;
          vel_x = his_max_vel_x;
        }
        //sha che qing kuang
        // if((vel_x - old_his_vel_x < -0.10) && vel_x > 0)
        // {
        //   vel_x = 0;
        //   ROS_ERROR("+ sha che");
        //   // breaking_cnt++;
        // }      
        // else if ((vel_x - old_his_vel_x > 0.10) && vel_x < 0)
        // {
        //   vel_x = 0;
        //   ROS_ERROR("- sha che");

        // }
        //fan xiang
        if (his_vel_x != 0 && ((his_vel_x > 0 && vel_x < 0) || (his_vel_x < 0 &&  vel_x > 0) ) ) 
        {
            vel_x = his_vel_x;
            // vel_x = 0;
        }
        //xian fu
        if ( std::fabs(vel_x)  > 900) 
        {
            // vel_x = 0;
            vel_x = his_vel_x;
        }
        // ROS_ERROR("vel_x: %f", vel_x);
        // ROS_ERROR("max_vel: %f", max_vel_x);
        // ROS_ERROR("op_max_vel: %f", op_max_vel_x);   
        // ROS_ERROR("min_vel: %f", min_vel_x) ;
        // ROS_ERROR("op_min_vel: %f", op_min_vel_x);
        return vel_x;
    }

    void predict(cv::RotatedRect& armor)
    {
        int armor_vel = armor_speed_calculat(armor);

//////////////只改框起来的参数！！！！！/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        int target_vel = armor_vel + yaw_vel * 50;        
        //需要配平 这里是速度配平的公式 需要现场测试 每辆车估计不一样 只更改yaw_vel乘的数值 使得目标不动云台动时不做预测 配平了就不要再改了
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
        
        int final_vel = vel_fliter(target_vel);   

/////////////只改框起来的参数！！！！！//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        armor.center.x = armor.center.x + final_vel * 5;
        //这里是控制预测量的大小final乘的系数
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        ROS_ERROR("armor_vel: %d , yaw_vel: %d ", armor_vel, yaw_vel);
        ROS_ERROR("before: %d , after: %d ", target_vel, final_vel);
    }



} // namespace predict_2d_point
