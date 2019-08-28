#pragma once

#include <fstream>
#include <string>
#include <math.h>
#include <thread>
#include <chrono>
#include <ctype.h>
#include <opencv2/ml.hpp>
#include <opencv2/opencv.hpp>

#include <ros/ros.h>
#include <ros/package.h>

#include <vector>
#include <list>

using namespace cv;
using namespace std;
using namespace cv::ml;

float w0,L_R;
int color;
int clockwise;
int Maxarea ,Minarea ;
int Maxarea_l,Minarea_l;
int Maxarea_center,Minarea_center;
int img_idx ;

class RuneInfo{
 public:
  RuneInfo(cv::RotatedRect armor_rect){
    rect = armor_rect;
  }
 public:
  cv::RotatedRect rect;
};


class Rune_class{
public: 
    vector<vector<Point> > contours_color;
    vector<vector<Point> > contours_color_l;
    vector<vector<Point> > contours_color_finall;
    vector<Point>  points_R_center;

    Point2f rune_cen_point;
    Point2f his_rune_cen_point;
    Point2f R_cen_point;
    Point2f predict_point;

    float length;
    float radius;
    float w0;
    float w;
    //int times;

    //Ptr<SVM> svm_small = StatModel::load<SVM>("../rune_svm.yml");

    Mat src;
    Mat binary_color_img;
    Mat gray_image;
    Mat binary_brightness_img;
    Mat binary;

public:

    Rune_class();

    void RUNE(uint8_t&,vector<RuneInfo>& armors,int &times);

    Point2f get_center_point(vector<Point> cen_r){
        Moments mu;  
        mu = moments(cen_r, false);	
        Point2f mc;
        mc = Point2f(mu.m10 / mu.m00, mu.m01 / mu.m00); 
        return mc;
    }

    float distance_hanshu(Point2f points,Point2f cen_R){
        float distances = sqrt((points.x-cen_R.x)*(points.x-cen_R.x) + (points.y-cen_R.y)*(points.y-cen_R.y));
        return distances;
    }

    // void gammaProcessImage(Mat& oriMat,double gamma,Mat &outputMat){
    //     Mat lookupTable(1,256,CV_8U);
    //     uchar* p = lookupTable.ptr();
    //     for (int i =0 ; i < 256; i++) {
    //         p[i] = saturate_cast<uchar>(pow(i/255.0, gamma) * 255.0);
    //     }
    //     LUT(oriMat,lookupTable,outputMat);
    // }

    // float rune_svm(Mat& img_roi){
    //     cv::Mat gradient_lst;
    //     HOGDescriptor hog;
    //     cv::Size wsize =  cv::Size(120,55);
    //     cv::resize(img_roi, img_roi, cv::Size(120,55));
    //     hog.winSize = wsize / 8 * 8;
    //     std::vector< float > descriptors;
    //     Rect roi = Rect((img_roi.cols - wsize.width ) / 2,(img_roi.rows - wsize.height ) / 2, wsize.width,wsize.height);
    //     hog.compute( img_roi(roi), descriptors, Size(8,8), Size(0,0));   
    //     float response = svm_small->predict(descriptors);
    //     return response;
    // }

};
