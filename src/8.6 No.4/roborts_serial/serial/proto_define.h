
/**
 * Robomaster Vision program of Autocar
 * Copyright (c) 2019, Xidian University Robotics Vision group.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
 * documentation files(the "Software"), to deal in the Software without restriction.
 */

#pragma once

#include <stdint.h>

/*
 * serial read proto
 */
typedef struct
{
  uint8_t sof;                  // 帧头 = 0A
  uint8_t cmd_mode;             // commod: 命令模式，0: 空闲 1: 自瞄 2: 打符 ...
  uint8_t gimbal_mode;          // gimbal: 云台模式，0: 发送角度 1: 发送速度
  int32_t gimbal_yaw;           // gimbal: 单位：角度 x 1000
  int16_t gimbal_pitch;         // gimbal: 单位：角度 x 1000
  uint8_t chassis_mode;         // chassis: 底盘模式，0: 云台坐标以底盘建系 1: 云台坐标以地面建系
  int16_t chassis_x;            // chassis: 底盘前行的速度，单位：todo
  int16_t chassis_y;            // chassis: 底盘平移的速度，单位：todo
  int16_t chassis_r;            // chassis: 底盘旋转的速度，单位：todo
  uint8_t armor_hurt_id;        // referee_system: 机器人受伤害id，按照装甲片id顺序定义 1 2 3 4 5
  int16_t remain_HP;            // referee_system: 机器人剩余血量，裁判系统数值，整数
  int16_t max_HP;               // referee_system: 机器人最大血量，裁判系统数值，整数
  int16_t bullet_speed;         // referee_system: 机器人枪口射速，裁判系统数值 x 10
  int16_t shooter_remain_heat;  // referee_system: 机器人剩余热量，裁判系统数值 x 10
  int16_t shooter_max_heat;     // referee_system: 机器人最大热量，裁判系统数值 x 10
  uint8_t end;                  // 帧尾 = B0
}__attribute__((packed)) data_read_t;

/*
 * serial write proto
 */
typedef struct
{
  uint8_t sof;                    // 帧头 = 0C
  uint8_t task_id;                // feedback: 见任务表，任务id
  uint8_t vision_data_status;     // feedback: 见任务表，数据状态
  int16_t vision_data_x;          // feedback: 整数，单位: mm
  int16_t vision_data_y;          // feedback: 整数，单位: mm
  int16_t vision_data_z;          // feedback: 整数，单位: mm
  uint8_t cmd_gimbal_mode;        // gimbal: 控制模式，1: 绝对角度 2: 相对角度 3: 绝对速度 4: 相对速度
  int16_t cmd_gimbal_yaw;         // gimbal: 云台控制，单位同接收
  int16_t cmd_gimbal_pitch;       // gimbal: 云台控制，单位同接收
  uint8_t cmd_gimbal_fric_speed;  // gimbal: 设置摩擦轮的转速档位，1: 12m/s 2: 18m/s 3: 24m/s 4: 30m/s
  uint8_t cmd_chassis_mode;       // chassis: 控制模式，0: 无效 1: 移动 2：陀螺CW 3：陀螺CCW
  int16_t cmd_chassis_x;          // chassis: 底盘前行的速度，单位：todo
  int16_t cmd_chassis_y;          // chassis: 底盘平移的速度，单位：todo
  int16_t cmd_chassis_r;          // chassis: 底盘旋转的速度，单位：todo
  uint8_t end;                    // 帧尾 = D0
}__attribute__((packed)) data_write_t;

