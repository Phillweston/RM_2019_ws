#pragma once 

#include<iostream>
#include<opencv2/opencv.hpp>
#include "opencv2/video/tracking.hpp"
#include "opencv2/highgui.hpp"
#include <vector>

#include <ros/ros.h>
#include <math.h>

#include <stdio.h>

#include "armor_count.h"

namespace predict_3d_point
{
    //angle
    float angle;
    float his_angle;
    float yaw_vel;
    float pitch_vel;

    //3D points
    cv::Point3f old_3d_point;
    cv::Point3f new_3d_point;
    cv::Point3f predict_3d_point;
    // cv::Point3f temp_3d_point;
    cv::Point3f temp_new_3d_point;
    cv::Point3f temp_old_3d_point;
    

    //speed
    float Vx;
    float Vz;
    float Vx_after_kalman;
    float Vz_after_kalman;

    //kalman
    RNG rng;
	const int winHeight=1600;
    const int winWidth=900;
	const int stateNum=4;                                      //状态值4×1向量(x,y,△x,△y)
	const int measureNum=2;                                    //测量值2×1向量(x,y)	
	KalmanFilter KF(stateNum, measureNum, 0);	
    Mat measurement;

    //vel fliter
    std::vector<float> vels_(5);
    std::vector<float> vels_copy(5);

    float temp_vel;
    float his_vel_x;
    int loop_cnt = 0;
    float max_vel_x = 0;
    float min_vel_x = 100000;
    float op_max_vel_x = 0;
    float op_min_vel_x = -100000;
    float his_max_vel_x = 0;
    float his_min_vel_x = 0;
    float old_his_vel_x = 0;

    bool vel_comp(const float &a, const float &b)
    {
        return abs(a) > abs(b);
    }

    void angle_adjust( float& angle_)
    {
        yaw_vel = angle_ - his_angle;
        int cnt = angle_ / 360;
        if (angle_ > 180)
        {
            angle_ = angle_ - 360 * cnt;
        }
        else if (angle_ < -180)
        {
            angle_ = angle_ + 360 * cnt;
        }
        else
        {
            angle_ = angle_;
        }
        angle = angle_ / 180 * 3.14159;
        
        
    }

    void kalman_fliter_init(double cost_time_)
    {
        //1.kalman filter setup       
 
	    KF.transitionMatrix = (Mat_<float>(4, 4) <<1,0,cost_time_,0,0,1,0,cost_time_,0,0,1,0,0,0,0,1);  //转移矩阵A
	    setIdentity(KF.measurementMatrix);                                             //测量矩阵H
	    setIdentity(KF.processNoiseCov, Scalar::all(1e-5));                            //系统噪声方差矩阵Q
	    setIdentity(KF.measurementNoiseCov, Scalar::all(1e-1));                        //测量噪声方差矩阵R
	    setIdentity(KF.errorCovPost, Scalar::all(1));                                  //后验错误估计协方差矩阵P
	    rng.fill(KF.statePost,RNG::UNIFORM,0,winHeight>winWidth?winWidth:winHeight);   //初始状态值x(0)
	    measurement = Mat::zeros(measureNum, 1, CV_32F);                           //初始测量值x'(0)，因为后面要更新这个值，所以必须先定义

    }


    void zero_angle_2_camera(cv::Point3f &camera_3d_point_, cv::Point3f &zero_gimbal_3d_point_)
    {
        camera_3d_point_.z = (zero_gimbal_3d_point_.z * cos(angle) ) + (zero_gimbal_3d_point_.x * sin(angle) );
        camera_3d_point_.x = -(zero_gimbal_3d_point_.z * sin(angle) ) + (zero_gimbal_3d_point_.x * cos(angle) );
        camera_3d_point_.y = zero_gimbal_3d_point_.y;
    }

    void camera2zero_angle(cv::Point3f &camera_3d_point_, cv::Point3f &zero_gimbal_3d_point_)
    {
        if (angle <= 0)  //yaw <= 0
        {
            // angle = -angle;
            zero_gimbal_3d_point_.x = (camera_3d_point_.x * cos(-angle) ) - (camera_3d_point_.z * sin(-angle) );
            zero_gimbal_3d_point_.z = (camera_3d_point_.x * sin(-angle) ) + (camera_3d_point_.z * cos(-angle) );
            zero_gimbal_3d_point_.y = camera_3d_point_.y;
            ROS_ERROR("X_after: %f , X: %f , Z: %f ", zero_gimbal_3d_point_.x, camera_3d_point_.x, camera_3d_point_.z);
            ROS_ERROR("sin: %f , cos: %f ", sin(-angle), cos(-angle) );
        }
        else if (angle > 0) //yaw > 0
        {
            
            zero_gimbal_3d_point_.x = (camera_3d_point_.x * cos(angle) ) + (camera_3d_point_.z * sin(angle) );
            zero_gimbal_3d_point_.z = -(camera_3d_point_.x * sin(angle) ) + (camera_3d_point_.z * cos(angle) );
            zero_gimbal_3d_point_.y = camera_3d_point_.y;
            ROS_ERROR("X_after: %f , X: %f , Z: %f ", zero_gimbal_3d_point_.x, camera_3d_point_.x, camera_3d_point_.z);
            ROS_ERROR("sin: %f , cos: %f ", sin(angle), cos(angle) );
        }
        
    }



    cv::Point kalman_fliter(cv::Point3f point_3d)
    {
        Mat prediction = KF.predict();
		Point predict_pt = Point(prediction.at<float>(0),prediction.at<float>(1) );   //预测值(x',y')
 
        measurement.at<float>(0) = (float)point_3d.x;
		measurement.at<float>(1) = (float)point_3d.z;
        // measurement.at<float>(2) = Vx;
        // measurement.at<float>(3) = Vz;
 
        KF.correct(measurement);

        return predict_pt;

    }

    float vel_fliter(float vel)
    {
        if(armor_count::armor_count > 10)    
        {
            
            max_vel_x = 0;
            min_vel_x = 100000;
            op_max_vel_x = 0;
            op_min_vel_x = -100000;
            his_max_vel_x = 0;
            his_min_vel_x = 0;
            old_his_vel_x = 0;
        }

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

        float vel_x = temp_vel;

        //feng zhi bao chi
        if(temp_vel > 0 && (temp_vel - his_vel_x) > -0.010) //jia su du a>0 su du v>0
        {
            if(temp_vel > max_vel_x )
            {
                max_vel_x = temp_vel;
            }
        }
        if(temp_vel > 0 && (temp_vel - his_vel_x) < 0.010) //jia su du a<0 su du v>0
        {
            if(temp_vel < min_vel_x)
            {
                min_vel_x = temp_vel;
            }
        }
        if(temp_vel < 0 && (temp_vel - his_vel_x) < 0.010) //jia su du a>0 su du v<0
        {
            if(temp_vel < op_max_vel_x )
            {
                op_max_vel_x = temp_vel;
            }
        }
        if(temp_vel < 0 && (temp_vel - his_vel_x) > -0.010) //jia su du a<0 su du v<0
        {
          if(temp_vel > op_min_vel_x)
          {
            op_min_vel_x = temp_vel;
          }
        } 
        
        if ( vel_x > 0.02 && (vel_x - his_vel_x) > -0.02 /*vel_x > 2*/)  //a>0, v>0
        {
          vel_x = max_vel_x;
          his_max_vel_x = vel_x;
        }
        else if ( vel_x > 0.02 && (vel_x - his_vel_x) < 0.02)           //a<0, v>0
        {
          vel_x = min_vel_x;
          his_min_vel_x = vel_x;
        }
        else if (vel_x < -0.02 && (vel_x - his_vel_x) < 0.02 /*vel_x < -2*/)  //a>0, v<0
        {
          vel_x = op_max_vel_x;
          his_max_vel_x = vel_x;
        }
        else if (vel_x < -0.02 && (vel_x - his_vel_x) > -0.02)             //a<0, v<0
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
        if((vel_x - old_his_vel_x < -0.10) && vel_x > 0)
        {
          vel_x = 0;
          ROS_ERROR("+ sha che");
          // breaking_cnt++;
        }      
        else if ((vel_x - old_his_vel_x > 0.10) && vel_x < 0)
        {
          vel_x = 0;
          ROS_ERROR("- sha che");

        }
        //fan xiang
        if (his_vel_x != 0 && ((his_vel_x > 0 && vel_x < 0) || (his_vel_x < 0 &&  vel_x > 0) ) ) 
        {
            vel_x = his_vel_x;
            // vel_x = 0;
        }
        //xian fu
        if ( std::fabs(vel_x)  > 6.0) 
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

    void predict_3dpoint(cv::Point3f new_3d_point_, double cost_time_, cv::Point3f &predict_3d_point_)     //cm and ms    need to check dan wei
    {
        new_3d_point = new_3d_point_;

        //to zero angle gimbal (useless!!!!)
        // camera2zero_angle(old_3d_point, temp_old_3d_point);
        // ROS_ERROR("OLD_3D: x: %f y: %f z: %f , AFTER_OLD_3D: x: %f y: %f z: %f ", old_3d_point.x, old_3d_point.y, old_3d_point.z, temp_old_3d_point.x, temp_old_3d_point.y, temp_old_3d_point.z);
        // old_3d_point = temp_old_3d_point;
        
        // camera2zero_angle(new_3d_point, temp_new_3d_point);
        // ROS_ERROR("NEW_3D: x: %f y: %f z: %f , AFTER_NEW_3D: x: %f y: %f z: %f ", new_3d_point_.x, new_3d_point_.y, new_3d_point_.z, temp_new_3d_point.x, temp_new_3d_point.y, temp_new_3d_point.z);
        // new_3d_point  = temp_new_3d_point;
        
        
        
        
        //calculate X speed and Z speed ( m/s )
        Vx = ((new_3d_point.x - old_3d_point.x) * 10) / cost_time_;   // cm / ms
        Vx = Vx + yaw_vel * new_3d_point.z / 100;
        // ROS_ERROR("v_yaw: %f", yaw_vel * new_3d_point.z / 100);
        Vz = ((new_3d_point.z - old_3d_point.z) * 10) / cost_time_;

        //Fliter the speed with self-writed vel model
        // Vx_after_kalman = vel_fliter(Vx);
        // Vz_after_kalman = vel_fliter(Vz);
        
        //predict point by using kalman
        // cv::Point temp_2d_point = kalman_fliter(new_3d_point);
        
        
        
        //calculate the point with the speed after kalman fliter
        predict_3d_point_.x = new_3d_point.x + Vx * cost_time_ / 10;
        ROS_ERROR("predict dist: %f", Vx * cost_time_ / 10);
        predict_3d_point_.y = new_3d_point.y;
        predict_3d_point_.z = new_3d_point.z + Vx_after_kalman * cost_time_ / 10;

        //return to camrera
        // zero_angle2camera(temp_3d_point, predict_3d_point_);
        // predict_3d_point_ = temp_3d_point;
        
        
    }



}