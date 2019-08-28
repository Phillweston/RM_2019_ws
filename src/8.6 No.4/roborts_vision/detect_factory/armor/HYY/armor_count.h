#pragma once 

#include<iostream>
#include<opencv2/opencv.hpp>
#include "opencv2/video/tracking.hpp"
#include "opencv2/highgui.hpp"
#include <vector>

#include <ros/ros.h>

namespace armor_count
{
    int armor_count = 0;
    int armor_loss_count = 0;


    
}
namespace his_armor_msgs
{
    cv::RotatedRect his_armor;
}