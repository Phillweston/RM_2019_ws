/**
 * Robomaster Vision program of Autocar
 * Copyright (c) 2019, Xidian University Robotics Vision group.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
 * documentation files(the "Software"), to deal in the Software without restriction.
 */

#include <ros/ros.h>
#include "proto_define.h"
#include "serial_device.h"

#include <thread>
#include <roborts_msgs/chassis_ctrl.h>
#include <roborts_msgs/chassis_info.h>
#include <roborts_msgs/feedback_ctrl.h>
#include <roborts_msgs/feedback_info.h>
#include <roborts_msgs/gimbal_ctrl.h>
#include <roborts_msgs/gimbal_info.h>
#include <roborts_msgs/referee_system.h>

#define PRINT_READ_INFO
#define PRINT_WRITE_INFO

namespace roborts_serial
{

class SerialNode
{
  roborts_sdk::SerialDevice serial;

  //thread
  std::thread read_thread_;
  std::thread write_thread_;

  //data
  data_read_t data_read;
  data_write_t data_write;

  // ros
  ros::NodeHandle ros_nh;
  
  ros::Publisher  ros_pub_chassis;
  ros::Publisher  ros_pub_feedback;
  ros::Publisher  ros_pub_gimbal;
  ros::Publisher  ros_pub_referee;

  ros::Subscriber ros_sub_chassis;
  ros::Subscriber ros_sub_feedback;
  ros::Subscriber ros_sub_gimbal;
  
  roborts_msgs::chassis_info   chassis_info_;
  roborts_msgs::feedback_info  feedback_info_;
  roborts_msgs::gimbal_info    gimbal_info_;
  roborts_msgs::referee_system referee_system_;

public:
  SerialNode(): serial("/dev/ttyUSB0", 115200)
  {
    ros_pub_chassis  = ros_nh.advertise<roborts_msgs::chassis_info>("chassis_info", 100);
    ros_pub_feedback = ros_nh.advertise<roborts_msgs::feedback_info>("feedback_info", 100);
    ros_pub_gimbal   = ros_nh.advertise<roborts_msgs::gimbal_info>("gimbal_info", 100);
    ros_pub_referee  = ros_nh.advertise<roborts_msgs::referee_system>("referee_system", 100);

    ros_sub_chassis  = ros_nh.subscribe("chassis_ctrl", 1, &SerialNode::ChassisCtrlCallBack, this);
    ros_sub_feedback = ros_nh.subscribe("feedback_ctrl", 1, &SerialNode::FeedbackCtrlCallBack, this);
    ros_sub_gimbal   = ros_nh.subscribe("gimbal_ctrl", 1, &SerialNode::GimbalCtrlCallBack, this);

    data_write.sof  = 0x0C;
    data_write.end  = 0xD0;

    // todo: 可能要加锁
    // data_write.task_id               = 1;
    // data_write.vision_data_status    = 4;
    // data_write.vision_data_x         = 314;
    // data_write.vision_data_y         = 512;
    // data_write.vision_data_z         = 1024;

    // data_write.cmd_gimbal_mode       = 0;
    // data_write.cmd_gimbal_yaw        = 1234;
    // data_write.cmd_gimbal_pitch      = 5678;
    // data_write.cmd_gimbal_fric_speed = 2;
   
    // data_write.cmd_chassis_mode      = 1;
    // data_write.cmd_chassis_x         = 1234;
    // data_write.cmd_chassis_y         = 1234;
    // data_write.cmd_chassis_r         = 1234;

    read_thread_ = std::thread(&SerialNode::ReadExecutor, this);
    write_thread_ = std::thread(&SerialNode::WriteExecutor, this);
  }

  void ChassisCtrlCallBack(const roborts_msgs::chassis_ctrl::ConstPtr & info)
  {
    data_write.cmd_chassis_mode      = info->cmd_chassis_mode;
    data_write.cmd_chassis_x         = static_cast<int16_t>(info->cmd_chassis_x * 100);
    data_write.cmd_chassis_y         = static_cast<int16_t>(info->cmd_chassis_y * 100);
    data_write.cmd_chassis_r         = static_cast<int16_t>(info->cmd_chassis_r * 100);

    // ROS_INFO("cmd_chassis_mode: %d", data_write.cmd_chassis_mode);
    // ROS_INFO("cmd_chassis_x: %d",    data_write.cmd_chassis_x);
    // ROS_INFO("cmd_chassis_y: %d",    data_write.cmd_chassis_y);
    // ROS_INFO("cmd_chassis_r: %d\n",    data_write.cmd_chassis_r);
  }

  void FeedbackCtrlCallBack(const roborts_msgs::feedback_ctrl::ConstPtr & info)
  {
    data_write.task_id               = info->task_id;
    data_write.vision_data_status    = info->vision_data_status;
    data_write.vision_data_x         = info->vision_data_x;
    data_write.vision_data_y         = info->vision_data_y;
    data_write.vision_data_z         = info->vision_data_z;

    // ROS_INFO("task_id: %d",            data_write.task_id);
    // ROS_INFO("vision_data_status: %d", data_write.vision_data_status);
    // ROS_INFO("vision_data_x: %d",      data_write.vision_data_x);
    // ROS_INFO("vision_data_y: %d",      data_write.vision_data_y);
    // ROS_INFO("vision_data_z: %d\n",      data_write.vision_data_z);
  }

  void GimbalCtrlCallBack(const roborts_msgs::gimbal_ctrl::ConstPtr & info)
  {
    data_write.cmd_gimbal_mode       = info->cmd_gimbal_mode;
    data_write.cmd_gimbal_yaw        = static_cast<int16_t>(info->cmd_gimbal_yaw * 100);  //+data_read.gimbal_yaw );
    data_write.cmd_gimbal_pitch      = static_cast<int16_t>(info->cmd_gimbal_pitch * 100);  //+data_read.gimbal_pitch);
    data_write.cmd_gimbal_fric_speed = info->cmd_gimbal_fric_speed;

    // ROS_INFO("cmd_gimbal_mode: %d",       data_write.cmd_gimbal_mode);
    // ROS_INFO("cmd_gimbal_yaw: %d",        data_write.cmd_gimbal_yaw);
    // ROS_INFO("cmd_gimbal_pitch: %d",      data_write.cmd_gimbal_pitch);
    // ROS_INFO("cmd_gimbal_fric_speed: %d\n", data_write.cmd_gimbal_fric_speed);
  }

  void ReadExecutor()
  {
    ROS_WARN("Serial ReadExecutor init OK.");

    int len = sizeof(data_read_t);
    uint8_t buff_read[len];
    uint8_t buff_read_fix[len];

    while(ros::ok())
    {
      serial.Read(buff_read, len);  // 设备未上电时，Read()暂停

      for(int i = 0; i < len; ++i)
      {
        if(buff_read[i] == 0x0A)
        {
          memcpy(buff_read_fix, buff_read + i, len - i);
          memcpy(buff_read_fix + len - i, buff_read, i);
          memcpy(&data_read, buff_read_fix, len);        
        }
      }

      if(data_read.sof == 0x0A && data_read.end == 0xB0)
      {
        feedback_info_.cmd_mode          = data_read.cmd_mode;
        ros_pub_feedback.publish(feedback_info_);

        gimbal_info_.gimbal_mode         = data_read.gimbal_mode;
        gimbal_info_.gimbal_yaw          = data_read.gimbal_yaw   / 100.;         
        gimbal_info_.gimbal_pitch        = data_read.gimbal_pitch / 100.;        
        ros_pub_gimbal.publish(gimbal_info_);

        chassis_info_.chassis_mode        = data_read.chassis_mode;
        chassis_info_.chassis_x           = data_read.chassis_x / 100.;
        chassis_info_.chassis_y           = data_read.chassis_y / 100.;
        chassis_info_.chassis_r           = data_read.chassis_r / 100.;
        ros_pub_chassis.publish(chassis_info_);

        referee_system_.armor_hurt_id       = data_read.armor_hurt_id;
        referee_system_.remain_HP           = data_read.remain_HP;
        referee_system_.max_HP              = data_read.max_HP;
        referee_system_.bullet_speed        = data_read.bullet_speed / 10.;
        referee_system_.shooter_remain_heat = data_read.shooter_remain_heat / 10.;
        referee_system_.shooter_max_heat    = data_read.shooter_max_heat / 10.;
        ros_pub_referee.publish(referee_system_);

#ifdef PRINT_READ_INFO
        ROS_WARN("serial reading...");
        // ROS_INFO("cmd_mode: %d",        feedback_info_.cmd_mode);
        // ROS_INFO("gimbal_mode: %d",     gimbal_info_.gimbal_mode);
        // ROS_INFO("gimbal_yaw: %f",    gimbal_info_.gimbal_yaw);
        ROS_INFO("gimbal_pitch: %f \n",  gimbal_info_.gimbal_pitch); 
        
        // ROS_INFO("chassis_mode: %d",  chassis_info_.chassis_mode);
        // ROS_INFO("chassis_x: %f",   chassis_info_.chassis_x);
        // ROS_INFO("chassis_y: %f",   chassis_info_.chassis_y);
        // ROS_INFO("chassis_r: %f \n",   chassis_info_.chassis_r);

        // ROS_INFO("armor_hurt_id: %d", referee_system_.armor_hurt_id);
        // ROS_INFO("remain_HP: %d",     referee_system_.remain_HP);
        // ROS_INFO("max_HP: %d",        referee_system_.max_HP);
        // ROS_INFO("bullet_speed: %d",  referee_system_.bullet_speed);
        // ROS_INFO("shooter_remain_heat: %d", referee_system_.shooter_remain_heat);
        // ROS_INFO("shooter_max_heat: %d \n",    referee_system_.shooter_max_heat);
#endif
      }

      std::this_thread::sleep_for(std::chrono::milliseconds(5));
    }
  }

  void WriteExecutor()
  {
    ROS_WARN("Serial WriteExecutor init OK.");

    int len = sizeof(data_write_t);
    uint8_t buff_write[len];

    while(1) // while(ros::ok())
    {
      memcpy(buff_write, &data_write, len);
      serial.Write(buff_write, len);

#ifdef PRINT_WRITE_INFO
      ROS_WARN("serial writing...");
      // ROS_INFO("task_id: %d",            data_write.task_id);
      // ROS_INFO("vision_data_status: %d", data_write.vision_data_status);
      // ROS_INFO("vision_data_x: %d",      data_write.vision_data_x);
      // ROS_INFO("vision_data_y: %d",      data_write.vision_data_y);
      // ROS_INFO("vision_data_z: %d",      data_write.vision_data_z);

      // ROS_INFO("cmd_gimbal_mode: %d",       data_write.cmd_gimbal_mode);
      // ROS_INFO("cmd_gimbal_yaw: %d",        data_write.cmd_gimbal_yaw);
      // ROS_INFO("cmd_gimbal_pitch: %d",      data_write.cmd_gimbal_pitch);
      // ROS_INFO("cmd_gimbal_fric_speed: %d", data_write.cmd_gimbal_fric_speed);
   
      // ROS_INFO("cmd_chassis_mode: %d", data_write.cmd_chassis_mode);
      // ROS_INFO("cmd_chassis_x: %d",    data_write.cmd_chassis_x);
      // ROS_INFO("cmd_chassis_y: %d",    data_write.cmd_chassis_y);
      // ROS_INFO("cmd_chassis_r: %d",    data_write.cmd_chassis_r);
#endif
       std::this_thread::sleep_for(std::chrono::milliseconds(10));
    }
  }

};

}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "serial_Write");
    
    roborts_serial::SerialNode serialnode;

    ros::AsyncSpinner async_spinner(2);
    async_spinner.start();
    ros::waitForShutdown();

  return 0;
}
