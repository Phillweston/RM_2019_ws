/*******************************************************************************************************************
Copyright 2017 Dajiang Innovations Technology Co., Ltd (DJI)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
documentation files(the "Software"), to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense, and / or sell copies of the Software, and 
to permit persons to whom the Software is furnished to do so, subject to the following conditions : 

The above copyright notice and this permission notice shall be included in all copies or substantial portions of
the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
*******************************************************************************************************************/

/**
 * Robomaster Vision program of Autocar
 * Copyright (c) 2018, Xidian University Robotics Vision group.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
 * documentation files(the "Software"), to deal in the Software without restriction.
 */

/**
 * Robomaster Vision program of RM2019
 * Copyright (c) 2019, Xidian University Robotics Vision group.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
 * documentation files(the "Software"), to deal in the Software without restriction.
 */
#pragma once

#include "../dep.h"

#include <thread>
#include <vector>
#include <thread>
#include <mutex>
#include <chrono>
#include "pnp_solver.h"
#include "gimbal/gimbal_control.h"
// ros
#include <ros/ros.h>
#include <ros/package.h>
// opencv
#include "opencv2/opencv.hpp"
#include "uvc/RMVideoCapture.hpp"
#include "mercure/mercure_driver.h"
//predict
#include "../detect_factory/armor/HYY/predict_3d_point.h"
#include "../detect_factory/armor/HYY/predicy_2d_point.h"
#include "../detect_factory/armor/HYY/predict_count.h"
//armor_fliter
#include "../detect_factory/armor/HYY/armor_count.h"
#include "../detect_factory/armor/HYY/target_change.h"
//rune
#include "../detect_factory/rune/Rune_fiall.h"

#ifdef USE_HYY
    #include "armor/HYY/constraint_set.h"
#endif



// #define VIDEO_PLAY

#ifndef VIDEO_PLAY
  #define VIDEO_REC
#endif
#define BUFFER_SIZE 3

enum BufferState { IDLE = 0, WRITE, READ };

class ImageFrame
{
  ros::NodeHandle ros_nh_public;
  ros::NodeHandle ros_nh_private;

  ros::Subscriber ros_sub_chassis;
  ros::Subscriber ros_sub_feedback;
  ros::Subscriber ros_sub_gimbal;
  ros::Subscriber ros_sub_referee;
  roborts_msgs::chassis_info   chassis_info_;
  roborts_msgs::feedback_info  feedback_info_;
  roborts_msgs::gimbal_info    gimbal_info_;
  roborts_msgs::referee_system referee_system_;

  ros::Publisher  ros_pub_chassis;
  ros::Publisher  ros_pub_feedback;
  ros::Publisher  ros_pub_gimbal;
  roborts_msgs::chassis_ctrl   chassis_ctrl_;
  roborts_msgs::feedback_ctrl  feedback_ctrl_;
  roborts_msgs::gimbal_ctrl    gimbal_ctrl_;

   //! ros gimbal tf
  geometry_msgs::TransformStamped gimbal_tf_;
  //! ros gimbal tf broadcaster
  tf::TransformBroadcaster        tf_broadcaster_;

  double gimbal_x_, gimbal_y_, gimbal_z_;
  std::string pitch_enable_;

  double cost;

  ///////////////////////////////////////////////////
  std::string camera_type_;
  int resolution_width_;
  int resolution_height_;
  // buffer
  std::vector<cv::Mat> image_buffer_;
  std::vector<BufferState> buffer_state_;
  std::mutex lock_;
  int latest_index_;
  int current_index_;
  cv::Mat image_raw_;

  // thread
	std::thread producer_thread_;
	std::thread consumer_thread_;
  std::thread surveillance_thread_;

  std::string video_dir_;
  std::string video_path_;
  // time
  std::chrono::high_resolution_clock::time_point capture_begin_;

  void InitRos()
	{
		ros_nh_public    = ros::NodeHandle();
		ros_sub_chassis  = ros_nh_public.subscribe("chassis_info", 1, &ImageFrame::ChassisInfoCallBack, this);
		ros_sub_feedback = ros_nh_public.subscribe("feedback_info", 1, &ImageFrame::FeedbackInfoCallBack, this);
    ros_sub_referee  = ros_nh_public.subscribe("referee_info", 1, &ImageFrame::RefereeInfoCallBack, this);

		//ros_pub_chassis  = ros_nh_public.advertise<roborts_msgs::chassis_ctrl>("chassis_ctrl", 10);
    ros_pub_feedback = ros_nh_public.advertise<roborts_msgs::feedback_ctrl>("feedback_ctrl", 10);
    ros_pub_gimbal   = ros_nh_public.advertise<roborts_msgs::gimbal_ctrl>("gimbal_ctrl", 10);

	}
  void LoadParam()
  {
    ros_nh_private   = ros::NodeHandle("~");
    ros_nh_private.getParam("camera_type", camera_type_);
    ros_nh_private.getParam("resolution_width", resolution_width_);
    ros_nh_private.getParam("resolution_height", resolution_height_);
    ros_nh_private.getParam("gimbal_x", gimbal_x_);
    ros_nh_private.getParam("gimbal_y", gimbal_y_);
    ros_nh_private.getParam("gimbal_z", gimbal_z_);
      // ros_message_init
    gimbal_tf_.header.frame_id = "base_link";
    gimbal_tf_.child_frame_id = "gimbal";
    gimbal_tf_.transform.translation.x = gimbal_x_;
    gimbal_tf_.transform.translation.y = gimbal_y_;
    gimbal_tf_.transform.translation.z = gimbal_z_;

    ros_nh_private.getParam("pitch_enable", pitch_enable_);

    if (pitch_enable_ == "yes")
      ros_sub_gimbal = ros_nh_public.subscribe("gimbal_info", 1, &ImageFrame::GimbalInfoCallBack, this);
		else if (pitch_enable_ == "no")
      ros_sub_gimbal = ros_nh_public.subscribe("gimbal_info", 1, &ImageFrame::GimbalInfoCallBackWithoutPitch, this);
    else
      ROS_ERROR("pitch_enable only 'yes' or 'no'.");

    ros_nh_private.getParam("video_path", video_path_);
  }
public:
  explicit ImageFrame(): latest_index_(-1), current_index_(-1), video_dir_("../")
  {
    InitRos();
    LoadParam();


    // init buffer
    image_buffer_.resize(BUFFER_SIZE);
    buffer_state_.resize(BUFFER_SIZE);

    for (int i = 0; i < buffer_state_.size(); ++i) {
      image_buffer_[i].create(resolution_height_, resolution_width_, CV_8UC3);
      buffer_state_[i] = BufferState::IDLE;
    }

    // init thread
#ifndef VIDEO_PLAY
    producer_thread_ = std::thread(&ImageFrame::ImageProducer, this);
#endif
	  consumer_thread_ = std::thread(&ImageFrame::ImageConsumer, this);
    //surveillance_thread_ = std::thread(&ImageFrame::ImageSurveillance, this);
  }

  void ImageProducer()
  {
    if(camera_type_ == "mercure")
    {
      camera::MercureDriver camera_driver;
      CameraLoop(camera_driver);
    }
    else if(camera_type_ == "uvc")
    {
      camera::RMVideoCapture camera_driver("/dev/video0", 3); 
      camera_driver.setVideoFormat(resolution_width_, resolution_height_, 1);
      camera_driver.startStream();
      camera_driver.setExposureTime(false, 100);
      CameraLoop(camera_driver);
    }
  }

  template<typename CameraType>
  void CameraLoop(CameraType& camera_driver)
  {
#ifdef VIDEO_REC
    char filename[128];
    time_t rawtime;
    struct tm *timeinfo;
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    sprintf(filename, "%s/armor_%04d%02d%02d_%02d%02d%02d.avi", video_dir_.c_str(),
              timeinfo->tm_year+1900, timeinfo->tm_mon+1, timeinfo->tm_mday,
              timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);

    cv::VideoWriter writer(filename, 
                           CV_FOURCC('M', 'J', 'P', 'G'), 
                           60.0, 
                           cv::Size(resolution_width_, resolution_height_));
#endif

    int idx = 0;
    while(true) {
      //capture_begin_ = std::chrono::high_resolution_clock::now();
      //auto write_begin = std::chrono::high_resolution_clock::now();
      if (buffer_state_[idx] != BufferState::READ) {
        camera_driver >> image_buffer_[idx];    // API
        buffer_state_[idx] = BufferState::WRITE;
        lock_.lock();
        latest_index_ = idx;
        //ROS_INFO("latest_index_: %d", latest_index_);
        lock_.unlock();
#ifdef VIDEO_REC
        writer.write(image_buffer_[idx]);
#endif
      }
      idx = (idx + 1) % BUFFER_SIZE;
      //ROS_ERROR("write time: %lf", std::chrono::duration<double, std::ratio<1, 1000000>>(std::chrono::high_resolution_clock::now() - write_begin).count());
    }
  }

  void ImageConsumer() 
  {
    ConstraintSet constraintset;
    Rune_class rune_class;
    std::vector<cv::Point3f> targets_3d;
    GimbalContrl gimbal_contrl;

    PnpSolver angle_solver_armor_small(12.4, 5.4);
    PnpSolver angle_solver_armor_big(21.6, 5.4);
    PnpSolver angle_solver_runes(24.5, 12.5);
    predict_3d_point::kalman_fliter_init(cost);

    cv::Point3f target_3d;
    int times = 0;

#ifdef VIDEO_PLAY
    cv::VideoCapture camera_driver;
    camera_driver.open("/My_codes/video_version/src/vision2019-using/video/armor_20190714_191754.avi");
#endif

    while(true)
    {
      auto speed_test_start_begin_time = std::chrono::steady_clock::now();
#ifdef VIDEO_PLAY
      camera_driver >> image_raw_;
      if(image_raw_.empty())
        ROS_ERROR("empty picture!");
#else
      lock_.lock();
      if (buffer_state_[latest_index_] == BufferState::WRITE) {
          buffer_state_[latest_index_] = BufferState::READ;
      } else {
        //ROS_INFO("No image is available.");
        //usleep(5000);
        lock_.unlock();
        continue;
      }
      current_index_ = latest_index_;
      //ROS_WARN("current_index_: %d\n", current_index_);
      lock_.unlock();
      image_raw_ = image_buffer_[current_index_];
     // constraintset.src_img_ = image_buffer_[current_index_];
#endif

      // feedback_info_.cmd_mode = 1;

      if(feedback_info_.cmd_mode != 2)
      {
        constraintset.src_img_ = image_raw_;
        // uint8_t flag;
        std::vector<ArmorInfo> armors;
        constraintset.Detect(feedback_ctrl_.vision_data_status, armors);
      
        //armor_fliter(time)
        if (armors.size())
        {
          armor_count::armor_count++;
          if (armor_count::armor_count < 4)
          {
            target_change::his_armor_center = armors[0].rect.center;
            armors.clear();
          }
          if (target_change::change_target(armors[0].rect) )
          {
            armors.clear();
            armor_count::armor_count = 0;
          }
          else
          {
            target_change::his_armor_center = armors[0].rect.center;
          }
        }
        else
        {
          armor_count::armor_count = 0;
        }
        // ROS_ERROR("armor_count: %d", armor_count::armor_count);

        //2D predict (useless ????)
        // if (armors.size())
        // {
        //   if (armor_count::armor_count > 10)
        //   {
        //     predict_2d_point::angle_speed_calculat(gimbal_info_.gimbal_yaw);
        //     predict_2d_point::predict(armors[0].rect);
        //     // predict_3d_point::predict_3dpoint(targets_3d[0], cost, predict_3d_point::predict_3d_point);  //will effect slover now 7.12 gong shi you wen ti
        //     predict_count::predict_count++;
        //     predict_2d_point::old_2d_point = armors[0].rect.center;
        //     predict_2d_point::his_yaw = gimbal_info_.gimbal_yaw;
        //     // targets_3d[0] = predict_3d_point::predict_3d_point;
            
        //   }
        //   else
        //   {
        //     predict_2d_point::reset_vel_fliter();
        //     predict_2d_point::old_2d_point = armors[0].rect.center;
        //     predict_2d_point::his_yaw = gimbal_info_.gimbal_yaw;
        //     predict_count::predict_count = 0;
        //   }
        // }

        targets_3d.clear();
        if(armors.size())
        {
          /*to draw Rrect*/
          for (uchar i = 0; i < armors.size(); i++)
          {
            cv::Point2f* vertices = new cv::Point2f[4];
            armors[i].rect.points(vertices);
            for (uchar j = 0; j < 4; j++)
            {
              cv::line(image_raw_, vertices[j], vertices[(j + 1) % 4], cv::Scalar(0, 255, 0), 8);
            }
          } 

          for (int idx = 0; idx != armors.size(); ++idx)
          {
            cv::Point3f target_3d;
            float ratio = armors[idx].rect.size.width / armors[idx].rect.size.height;
            bool shootable = false;
            
            if (1 <= ratio && ratio <= 2.5)  //small armor get xyz
            {
              shootable = angle_solver_armor_small.GetXYZ(armors[idx].rect, target_3d);
              // ROS_ERROR("small armor");
            }
            else if(2.5 < ratio && ratio <= 4.2)  //big armor get xyz
            {
              shootable = angle_solver_armor_big.GetXYZ(armors[idx].rect, target_3d);
              // ROS_ERROR("big armor");
            }
            else
            {
              shootable = false;
            }
            
            if(shootable)
            {
              targets_3d.push_back(target_3d);
            }
          }
        }
        
        feedback_ctrl_.task_id            = 0;
        // decision
        if (targets_3d.size())
        {
          feedback_ctrl_.vision_data_x = targets_3d[0].x;
          feedback_ctrl_.vision_data_y = targets_3d[0].y;
          feedback_ctrl_.vision_data_z = targets_3d[0].z;

          gimbal_contrl.SolveContrlAgnle(targets_3d[0], 
                                  gimbal_ctrl_.cmd_gimbal_yaw, 
                                  gimbal_ctrl_.cmd_gimbal_pitch);
                  gimbal_ctrl_.cmd_gimbal_pitch*=-1;
          ROS_WARN("yaw = %f, pitch = %f",   gimbal_ctrl_.cmd_gimbal_yaw,  gimbal_ctrl_.cmd_gimbal_pitch);
          

          if(targets_3d[0].z>=0 && targets_3d[0].z<=1000)
              feedback_ctrl_.task_id            = 0;
            else if(targets_3d[0].z<=3000)
              feedback_ctrl_.task_id            = 4;
            else if(targets_3d[0].z<=4000)
              feedback_ctrl_.task_id            = 3;
            else if(targets_3d[0].z<=5000)
              feedback_ctrl_.task_id            = 2;
            else if(targets_3d[0].z>5000)
              feedback_ctrl_.task_id            = 1;
        }
        else
        {
          gimbal_ctrl_.cmd_gimbal_yaw  = 0;
          gimbal_ctrl_.cmd_gimbal_pitch= 0;
          ROS_WARN("yaw = %f, pitch = %f",   gimbal_ctrl_.cmd_gimbal_yaw,  gimbal_ctrl_.cmd_gimbal_pitch);   
        }
        
        gimbal_ctrl_.cmd_gimbal_mode           = 1;

        ros_pub_gimbal.publish(gimbal_ctrl_);
        ros_pub_feedback.publish(feedback_ctrl_);

        // cv::imshow("show", image_raw_);
        // cv::waitKey(1);

  #ifdef VIDEO_PLAY
        cv::waitKey(0);
  #endif
        /////////////////////////////////////////////////////////////
        cost = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::steady_clock::now() - speed_test_start_begin_time).count() / 1000.0;
        //ROS_INFO("total time cost = %.2f ms", cost);
        
        buffer_state_[current_index_] = BufferState::IDLE;
      }
      //////////////////////////////////////////////////////////////////////
      else
      {
        rune_class.src = image_buffer_[current_index_];
        // uint8_t flag;
        std::vector<RuneInfo> runes;
        rune_class.RUNE(feedback_ctrl_.vision_data_status,runes,times);
 
        targets_3d.clear();

        feedback_ctrl_.task_id   = 0;
        feedback_ctrl_.vision_data_status = 0;
      
        gimbal_ctrl_.cmd_gimbal_yaw  = 0;
        gimbal_ctrl_.cmd_gimbal_pitch= 0;

        if(runes.size())
        {
          /*to draw Rrect*/
          for (int idx = 0; idx != runes.size(); ++idx)
          {
            bool shootable = angle_solver_runes.GetXYZ(runes[idx].rect, target_3d);
            if(shootable)
            {
              targets_3d.push_back(target_3d);
              feedback_ctrl_.vision_data_status = 1;
            }
          }
          // step4: check
          if (targets_3d.size())
          {
            feedback_ctrl_.vision_data_x = targets_3d[0].x;
            feedback_ctrl_.vision_data_y = targets_3d[0].y;
            feedback_ctrl_.vision_data_z = targets_3d[0].z;

            //std::cout<<targets_3d[0].z<<std::endl;

            gimbal_contrl.SolveContrlAgnle(targets_3d[0], 
                                    gimbal_ctrl_.cmd_gimbal_yaw, 
                                    gimbal_ctrl_.cmd_gimbal_pitch);
              
            gimbal_ctrl_.cmd_gimbal_pitch*=-1;// 为了让其收敛

            gimbal_ctrl_.cmd_gimbal_pitch+=1;
          }
        }

        feedback_ctrl_.task_id = 0;
        // decision
        
        gimbal_ctrl_.cmd_gimbal_mode = 1;

        ros_pub_gimbal.publish(gimbal_ctrl_);
        ros_pub_feedback.publish(feedback_ctrl_);

        // cv::imshow("runes", rune_class.src);
        // cv::waitKey(1);

  #ifdef VIDEO_PLAY
        cv::waitKey(0);
  #endif
        /////////////////////////////////////////////////////////////
        cost = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::steady_clock::now() - speed_test_start_begin_time).count() / 1000.0;
        //ROS_INFO("total time cost = %.2f ms", cost);
        
        buffer_state_[current_index_] = BufferState::IDLE;
      }
    }
  }

  void ImageSurveillance()
  {
    while(true)
    {
      for (int i = 0; i < BUFFER_SIZE; ++i) {
        switch (buffer_state_[i])
        {
        case BufferState::IDLE:
          ROS_ERROR("[%d] BufferState::IDLE",i);
          break;
        case BufferState::WRITE:
          ROS_ERROR("[%d] BufferState::WRITE",i);
          break;
        case BufferState::READ:
          ROS_ERROR("[%d] BufferState::READ",i);
          break;
        default:
          break;
        }
      }
      usleep(5000);
    }
  }

  void ChassisInfoCallBack(const roborts_msgs::chassis_info::ConstPtr & info)
  {
    chassis_info_.chassis_mode = info->chassis_mode;
    chassis_info_.chassis_x    = info->chassis_x;
    chassis_info_.chassis_y    = info->chassis_y;
    chassis_info_.chassis_r    = info->chassis_r;

    // ROS_INFO("chassis_mode: %d",  chassis_info_.chassis_mode);
    // ROS_INFO("chassis_x: %f",   chassis_info_.chassis_x);
    // ROS_INFO("chassis_y: %f",   chassis_info_.chassis_y);
    // ROS_INFO("chassis_r: %f \n",   chassis_info_.chassis_r);
  }

  void FeedbackInfoCallBack(const roborts_msgs::feedback_info::ConstPtr & info)
  {
    feedback_info_.cmd_mode = info->cmd_mode; 
  }

  void GimbalInfoCallBack(const roborts_msgs::gimbal_info::ConstPtr & info)
  {
    gimbal_info_.gimbal_mode = info->gimbal_mode;
    gimbal_info_.gimbal_yaw  = info->gimbal_yaw;
    gimbal_info_.gimbal_yaw  = info->gimbal_pitch;

    ros::Time current_time = ros::Time::now();
    geometry_msgs::Quaternion q = tf::createQuaternionMsgFromRollPitchYaw(0.0,
                                                                        info->gimbal_pitch / 180.0 * M_PI,
                                                                        info->gimbal_yaw / 180.0 * M_PI);
    gimbal_tf_.header.stamp = current_time;
    gimbal_tf_.transform.rotation = q;
    tf_broadcaster_.sendTransform(gimbal_tf_);

    // ROS_INFO("cmd_mode: %d",        feedback_info_.cmd_mode);
    // ROS_INFO("gimbal_mode: %d",     gimbal_info_.gimbal_mode);
    // ROS_INFO("gimbal_yaw: %f",    gimbal_info_.gimbal_yaw);
    // ROS_INFO("gimbal_pitch: %f \n",  gimbal_info_.gimbal_pitch); 

  }

  void GimbalInfoCallBackWithoutPitch(const roborts_msgs::gimbal_info::ConstPtr & info)
  {
    gimbal_info_.gimbal_mode = info->gimbal_mode;
    gimbal_info_.gimbal_yaw  = info->gimbal_yaw;
    gimbal_info_.gimbal_yaw  = info->gimbal_pitch;

    ros::Time current_time = ros::Time::now();
    geometry_msgs::Quaternion q = tf::createQuaternionMsgFromRollPitchYaw(0.0, 0.0,
                                                                        info->gimbal_yaw / 180.0 * M_PI);
    gimbal_tf_.header.stamp = current_time;
    gimbal_tf_.transform.rotation = q;
    tf_broadcaster_.sendTransform(gimbal_tf_);

    // ROS_INFO("cmd_mode: %d",        feedback_info_.cmd_mode);
    // ROS_INFO("gimbal_mode: %d",     gimbal_info_.gimbal_mode);
    // ROS_INFO("gimbal_yaw: %f",    gimbal_info_.gimbal_yaw);
    // ROS_INFO("gimbal_pitch: %f \n",  gimbal_info_.gimbal_pitch); 
  }

  void RefereeInfoCallBack(const roborts_msgs::referee_system::ConstPtr & info)
  {
    referee_system_.armor_hurt_id       = info->armor_hurt_id;
    referee_system_.remain_HP           = info->remain_HP;
    referee_system_.max_HP              = info->max_HP;
    referee_system_.bullet_speed        = info->bullet_speed;
    referee_system_.shooter_remain_heat = info->shooter_remain_heat;
    referee_system_.shooter_max_heat    = info->shooter_max_heat;

    // ROS_INFO("armor_hurt_id: %d", referee_system_.armor_hurt_id);
    // ROS_INFO("remain_HP: %d",     referee_system_.remain_HP);
    // ROS_INFO("max_HP: %d",        referee_system_.max_HP);
    // ROS_INFO("bullet_speed: %d",  referee_system_.bullet_speed);
    // ROS_INFO("shooter_remain_heat: %d", referee_system_.shooter_remain_heat);
    // ROS_INFO("shooter_max_heat: %d \n",    referee_system_.shooter_max_heat);
  }
};