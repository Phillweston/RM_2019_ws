#pragma once 

#include<iostream>
#include<opencv2/opencv.hpp>
#include "opencv2/video/tracking.hpp"
#include "opencv2/highgui.hpp"
#include <vector>

#include <ros/ros.h>
#include <math.h>

namespace target_change
{
    cv::Point2f his_armor_center;

    bool change_target(cv::RotatedRect& armor)
    {
        int dis = std::sqrt( (his_armor_center.x - armor.center.x)*(his_armor_center.x - armor.center.x) + (his_armor_center.y - armor.center.y)*(his_armor_center.y - armor.center.y) );
        if (dis > 140)
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
}