project(roborts_msgs)
cmake_minimum_required(VERSION 3.1)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR})
find_package(catkin REQUIRED COMPONENTS
  std_msgs
  nav_msgs
  geometry_msgs
  actionlib
  message_generation
)

add_message_files(
  DIRECTORY chassis
  FILES
  chassis_ctrl.msg
  chassis_info.msg
)

add_message_files(
  DIRECTORY feedback
  FILES
  feedback_ctrl.msg 
  feedback_info.msg
)

add_message_files(
  DIRECTORY gimbal
  FILES
  gimbal_ctrl.msg 
  gimbal_info.msg 
 
)

add_message_files(
  DIRECTORY referee_system
  FILES
  referee_system.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  nav_msgs
)

catkin_package()
