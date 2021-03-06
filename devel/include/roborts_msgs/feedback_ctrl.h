// Generated by gencpp from file roborts_msgs/feedback_ctrl.msg
// DO NOT EDIT!


#ifndef ROBORTS_MSGS_MESSAGE_FEEDBACK_CTRL_H
#define ROBORTS_MSGS_MESSAGE_FEEDBACK_CTRL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace roborts_msgs
{
template <class ContainerAllocator>
struct feedback_ctrl_
{
  typedef feedback_ctrl_<ContainerAllocator> Type;

  feedback_ctrl_()
    : task_id(0)
    , vision_data_status(0)
    , vision_data_x(0.0)
    , vision_data_y(0.0)
    , vision_data_z(0.0)  {
    }
  feedback_ctrl_(const ContainerAllocator& _alloc)
    : task_id(0)
    , vision_data_status(0)
    , vision_data_x(0.0)
    , vision_data_y(0.0)
    , vision_data_z(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _task_id_type;
  _task_id_type task_id;

   typedef uint8_t _vision_data_status_type;
  _vision_data_status_type vision_data_status;

   typedef float _vision_data_x_type;
  _vision_data_x_type vision_data_x;

   typedef float _vision_data_y_type;
  _vision_data_y_type vision_data_y;

   typedef float _vision_data_z_type;
  _vision_data_z_type vision_data_z;





  typedef boost::shared_ptr< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> const> ConstPtr;

}; // struct feedback_ctrl_

typedef ::roborts_msgs::feedback_ctrl_<std::allocator<void> > feedback_ctrl;

typedef boost::shared_ptr< ::roborts_msgs::feedback_ctrl > feedback_ctrlPtr;
typedef boost::shared_ptr< ::roborts_msgs::feedback_ctrl const> feedback_ctrlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::roborts_msgs::feedback_ctrl_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace roborts_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'roborts_msgs': ['/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis', '/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback', '/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal', '/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68a1b9aca52b30f74d28848b0013eff7";
  }

  static const char* value(const ::roborts_msgs::feedback_ctrl_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68a1b9aca52b30f7ULL;
  static const uint64_t static_value2 = 0x4d28848b0013eff7ULL;
};

template<class ContainerAllocator>
struct DataType< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roborts_msgs/feedback_ctrl";
  }

  static const char* value(const ::roborts_msgs::feedback_ctrl_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8   task_id\n\
uint8   vision_data_status\n\
float32 vision_data_x\n\
float32 vision_data_y\n\
float32 vision_data_z\n\
";
  }

  static const char* value(const ::roborts_msgs::feedback_ctrl_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.task_id);
      stream.next(m.vision_data_status);
      stream.next(m.vision_data_x);
      stream.next(m.vision_data_y);
      stream.next(m.vision_data_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct feedback_ctrl_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::roborts_msgs::feedback_ctrl_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::roborts_msgs::feedback_ctrl_<ContainerAllocator>& v)
  {
    s << indent << "task_id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.task_id);
    s << indent << "vision_data_status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.vision_data_status);
    s << indent << "vision_data_x: ";
    Printer<float>::stream(s, indent + "  ", v.vision_data_x);
    s << indent << "vision_data_y: ";
    Printer<float>::stream(s, indent + "  ", v.vision_data_y);
    s << indent << "vision_data_z: ";
    Printer<float>::stream(s, indent + "  ", v.vision_data_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBORTS_MSGS_MESSAGE_FEEDBACK_CTRL_H
