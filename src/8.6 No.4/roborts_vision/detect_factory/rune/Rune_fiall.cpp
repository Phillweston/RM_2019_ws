#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <opencv2/opencv.hpp>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "Rune_fiall.h"

using namespace cv;
using namespace std;

//#define USE_VIDEO
//#define debug


Rune_class::Rune_class()
{
    std::string file_name = ros::package::getPath("roborts_vision") + "/detect_factory/rune/rune.xml";
    cv::FileStorage fs(file_name, cv::FileStorage::READ);
    if(!fs.isOpened())
        ROS_ERROR ("Cannot open armor param file, please check if the file is exist");
    else
        ROS_INFO ("open param file.....ok");
  
    //fs读取
    fs["enemy_color"] >> color;
    fs["Maxarea"] >> Maxarea;
    fs["Minarea"] >> Minarea;
    fs["Maxarea_l"] >> Maxarea_l;
    fs["Minarea_l"] >> Minarea_l;
    fs["Maxarea_center"] >> Maxarea_center;
    fs["Minarea_center"] >> Minarea_center;
    fs["img_idx"] >> img_idx;
}

void Rune_class::RUNE(uint8_t& vision_data_status,std::vector<RuneInfo>& armors,int &times)
{
    contours_color_finall.clear();
    contours_color_l.clear();
    contours_color.clear();

    double start = static_cast<double>(getTickCount());

    vector<Mat> bgr_channel;
	split(src, bgr_channel);
    cvtColor(src,gray_image,COLOR_RGB2GRAY);

    Mat element = getStructuringElement(MORPH_RECT, Size(3, 3));
    Mat element_1 = getStructuringElement(MORPH_RECT, Size(5, 5));

	if(color == 0){
        threshold(gray_image, binary_brightness_img, 150, 255, CV_THRESH_BINARY);
        binary_color_img = (bgr_channel.at(2)-bgr_channel.at(1));
        threshold(binary_color_img,binary_color_img ,50, 255, CV_THRESH_BINARY);//50
    }

	else{
        threshold(gray_image, binary_brightness_img, 150, 255, CV_THRESH_BINARY);
        binary_color_img = 2*bgr_channel.at(0)-bgr_channel.at(2);
        threshold(binary_color_img,binary_color_img, 120, 255, CV_THRESH_BINARY);//130
    }

    // dilate(binary_brightness_img,binary_brightness_img,element);

    dilate(binary_color_img,binary_color_img,element);
   // GaussianBlur(binary_color_img,binary,Size(3,3),0,0);

#ifdef debug
        imshow("brightness",binary_brightness_img);
        imshow("color",binary_color_img);
#endif
    
    binary = binary_color_img & binary_brightness_img;

    dilate(binary,binary,element);

    threshold(binary,binary,250,255, CV_THRESH_BINARY);
    findContours(binary,contours_color_l, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE);//旋臂

#ifdef debug
    imshow("binary",binary);
#endif

    if(contours_color_l.empty())
    {
        double time = ((double)getTickCount() - start) / getTickFrequency();
        cout<<"悬臂空"<<endl;
        return;
    }

    floodFill(binary,Point(3,3),Scalar(255));
    threshold(binary,binary_color_img,0,255,THRESH_BINARY_INV);//漫水算法

    morphologyEx(binary_color_img, binary_color_img, MORPH_OPEN, element);
    findContours(binary_color_img,contours_color, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE);

    // imshow("floodFill",binary_color_img);
    // waitKey(1);

    for(int i=0;i<contours_color_l.size();i++)//旋臂筛选
    {
        double Cont = fabs(contourArea(contours_color_l[i],true));
        if(Cont>100)
             cout<<"悬臂"<<Cont<<endl;
        if(Cont < Maxarea_l && Cont > Minarea_l){
            contours_color_finall.push_back(contours_color_l[i]);
            break;
        }
    }

    if(contours_color_finall.empty())
    {
        double time = ((double)getTickCount() - start) / getTickFrequency();
        ROS_INFO("xuanbi.empty");
        return;
    }

    for(int i=0;i<contours_color_l.size();i++)//中心点筛选 - 大符
    {
        double Cont = fabs(contourArea(contours_color_l[i],true));
        if(Cont < Maxarea_center && Cont > Minarea_center){
            //R_cen_point = get_center_point(contours_color_l[i]);
            //break;
            points_R_center.push_back(get_center_point(contours_color_l[i]));
        }
    }

    vector<vector<Point> >contours_ploy(contours_color.size());
    vector<RotatedRect> RotatedRect_ploy;
    RotatedRect predict_rect;

    float min,max;

    for(int i=0;i<contours_color.size();i++)
    {
        double Cont = fabs(contourArea(contours_color[i],true));
        if(Cont>300)
            cout<<"漫水:"<<Cont<<endl;
        approxPolyDP(contours_color[i], contours_ploy[i], 5, true);//最小包围矩形
        RotatedRect temp1 = minAreaRect(contours_ploy[i]);
        if(temp1.size.width > temp1.size.height){
            min = temp1.size.height;
            max = temp1.size.width;
        }
        else{
            max = temp1.size.height;
            min = temp1.size.width;
        }

        float size;
        size = max/min;
        //cout<<size<<endl;
        if(size >1 && size< 3 && Cont < Maxarea && Cont > Minarea){//1.2 3
            RotatedRect_ploy.push_back(temp1);
        }
    }
    if(RotatedRect_ploy.empty())
    {
        cout<<"manshui.empty"<<endl;
        double time = ((double)getTickCount() - start) / getTickFrequency();
        return ;
    }
    cout<<"***********************"<<endl;
    Point2f pot[4],pots[4];
    float angle;
    for (int i = 0; i< RotatedRect_ploy.size(); i++)
    {
        RotatedRect_ploy[i].points(pot);

        if(pointPolygonTest(contours_color_finall[0],RotatedRect_ploy[i].center,false) == 1)//判断那个装甲板在旋臂里
        {
            predict_rect = RotatedRect_ploy[i];
            angle = RotatedRect_ploy[i].angle;
            // pot_cen = RotatedRect_ploy[i].center;
            for(int j=0; j<4; j++)
            {
                line(src, pot[j], pot[(j+1)%4], Scalar(0,255,0),4);
            }
            // cout<<"yes"<<endl;
            rune_cen_point = RotatedRect_ploy[i].center;
            break;
        }
    }
    // if(predict_rect.size.height > predict_rect.size.width)
    //     predict_rect.size.width = predict_rect.size.height / 1.8;
    // else
    //     predict_rect.size.height = predict_rect.size.width / 1.8;
    
    // // cout<<"size:"<<points_R_center.size()<<endl;
    // for( int i = 0; i< points_R_center.size();i++)
    // {
    //     if(distance_hanshu(rune_cen_point,points_R_center[i]) < 150 && distance_hanshu(rune_cen_point,points_R_center[i]) >120)
    //     {
    //         R_cen_point = points_R_center[i];
    //         break;
    //     }
    // }
    // ///判断大符还是小符
    // //cout<<"R:"<<R_cen_point<<endl;
    // ////////////////////////////////////////////////////////////////////////////////////////////
    // radius = distance_hanshu(rune_cen_point,R_cen_point);
    // w0 = asin(fabsf(rune_cen_point.y - R_cen_point.y) / radius);
    // //判断象限 与 顺时针
    // int xiangxian = 0;
    // if(rune_cen_point.x > R_cen_point.x && rune_cen_point.y < R_cen_point.y)
    // {        
    //     xiangxian = 1;
    //     if(rune_cen_point.x > his_rune_cen_point.x && rune_cen_point.y > his_rune_cen_point.y)
    //         times = times + 1;
    // }
    // else if(rune_cen_point.x > R_cen_point.x && rune_cen_point.y > R_cen_point.y)
    // {
    //     xiangxian = 2;
    //     if(rune_cen_point.x < his_rune_cen_point.x && rune_cen_point.y > his_rune_cen_point.y)
    //         times = times +1;
    // }
    // else if(rune_cen_point.x < R_cen_point.x && rune_cen_point.y > R_cen_point.y )  
    // {
    //     xiangxian = 3;
    //     if(rune_cen_point.x < his_rune_cen_point.x && rune_cen_point.y < his_rune_cen_point.y)
    //         times = times + 1;
    // }
    // else if(rune_cen_point.x < R_cen_point.x && rune_cen_point.y < R_cen_point.y)
    // {
    //     xiangxian = 4;
    //     if(rune_cen_point.x > his_rune_cen_point.x && rune_cen_point.y < his_rune_cen_point.y)
    //         times = times + 1;
    // }
    // if( times == 4 )//确定顺时针
    //     clockwise = 1;
    // //cout<<"times:"<<times<<endl;
    // float angle_1 = 0.01745 * 18;
    // float predict_angle;
    // if(times > 5){
    // if(clockwise == 1 )//顺时针
    // {
    //     if(xiangxian == 1)
    //     {
    //         w = w0 - angle_1;
    //         predict_point.x = cos(w) * radius + R_cen_point.x;
    //         predict_point.y = -sin(w) * radius + R_cen_point.y;
    //     }
    //     if(xiangxian == 3)
    //     {
    //         w = w0 - angle_1;
    //         predict_point.x = -cos(w) * radius + R_cen_point.x;
    //         predict_point.y = sin(w) * radius + R_cen_point.y;
    //     }
    //     if(xiangxian == 2)
    //     {
    //         w = w0 + angle_1;
    //         predict_point.x = cos(w) * radius + R_cen_point.x;
    //         predict_point.y = sin(w) * radius + R_cen_point.y;

    //     }
    //     if(xiangxian == 4)
    //     {
    //         w = w0 + angle_1;
    //         predict_point.x = -cos(w) * radius + R_cen_point.x;
    //         predict_point.y = -sin(w) * radius + R_cen_point.y;
    //     }
    //     predict_angle = predict_rect.angle + angle_1 * 180 /3.1415926;
    // }
    // else if(clockwise == 0 )//逆时针
    // {
    //     if(xiangxian == 1)
    //     {   
    //         w = w0 + angle_1;
    //         predict_point.x = cos(w) * radius + R_cen_point.x;
    //         predict_point.y = -sin(w) * radius + R_cen_point.y;
    //     }
    //     if(xiangxian == 3)
    //     {
    //         w = w0 + angle_1;
    //         predict_point.x = -cos(w) * radius + R_cen_point.x;
    //         predict_point.y = sin(w) * radius + R_cen_point.y;
    //     }
    //     if(xiangxian == 2)
    //     {
    //         w = w0 - angle_1;
    //         predict_point.x = cos(w) * radius + R_cen_point.x;
    //         predict_point.y = sin(w) * radius + R_cen_point.y;
    //     }
    //     if(xiangxian == 4)
    //     {
    //         w = w0 - angle_1;
    //         predict_point.x = -cos(w) * radius + R_cen_point.x;
    //         predict_point.y = -sin(w) * radius + R_cen_point.y;
    //     }
    //     predict_angle = predict_rect.angle - angle_1 * 180 /3.1415926;
    // }

    // RotatedRect predict_rune_rect(predict_point,predict_rect.size,predict_angle);

    // RuneInfo armor(predict_rune_rect);

   RuneInfo armor(predict_rect);

    armors.push_back(armor);
    // }
    // else
    // {
    //     return ;
    // }
    
    his_rune_cen_point = rune_cen_point;

    double time = ((double)getTickCount() - start) / getTickFrequency();
    // cout << time << "秒" << endl;
}

