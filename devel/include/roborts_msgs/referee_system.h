// Generated by gencpp from file roborts_msgs/referee_system.msg
// DO NOT EDIT!


#ifndef ROBORTS_MSGS_MESSAGE_REFEREE_SYSTEM_H
#define ROBORTS_MSGS_MESSAGE_REFEREE_SYSTEM_H


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
struct referee_system_
{
  typedef referee_system_<ContainerAllocator> Type;

  referee_system_()
    : armor_hurt_id(0)
    , remain_HP(0)
    , max_HP(0)
    , bullet_speed(0.0)
    , shooter_remain_heat(0.0)
    , shooter_max_heat(0.0)  {
    }
  referee_system_(const ContainerAllocator& _alloc)
    : armor_hurt_id(0)
    , remain_HP(0)
    , max_HP(0)
    , bullet_speed(0.0)
    , shooter_remain_heat(0.0)
    , shooter_max_heat(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _armor_hurt_id_type;
  _armor_hurt_id_type armor_hurt_id;

   typedef int16_t _remain_HP_type;
  _remain_HP_type remain_HP;

   typedef int16_t _max_HP_type;
  _max_HP_type max_HP;

   typedef float _bullet_speed_type;
  _bullet_speed_type bullet_speed;

   typedef float _shooter_remain_heat_type;
  _shooter_remain_heat_type shooter_remain_heat;

   typedef float _shooter_max_heat_type;
  _shooter_max_heat_type shooter_max_heat;





  typedef boost::shared_ptr< ::roborts_msgs::referee_system_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::roborts_msgs::referee_system_<ContainerAllocator> const> ConstPtr;

}; // struct referee_system_

typedef ::roborts_msgs::referee_system_<std::allocator<void> > referee_system;

typedef boost::shared_ptr< ::roborts_msgs::referee_system > referee_systemPtr;
typedef boost::shared_ptr< ::roborts_msgs::referee_system const> referee_systemConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::roborts_msgs::referee_system_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::roborts_msgs::referee_system_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::roborts_msgs::referee_system_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::roborts_msgs::referee_system_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roborts_msgs::referee_system_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::roborts_msgs::referee_system_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roborts_msgs::referee_system_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::roborts_msgs::referee_system_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::roborts_msgs::referee_system_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358d70f927f6ebe96797d1e067a0a634";
  }

  static const char* value(const ::roborts_msgs::referee_system_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358d70f927f6ebe9ULL;
  static const uint64_t static_value2 = 0x6797d1e067a0a634ULL;
};

template<class ContainerAllocator>
struct DataType< ::roborts_msgs::referee_system_<ContainerAllocator> >
{
  static const char* value()
  {
    return "roborts_msgs/referee_system";
  }

  static const char* value(const ::roborts_msgs::referee_system_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::roborts_msgs::referee_system_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8   armor_hurt_id\n\
int16   remain_HP\n\
int16   max_HP\n\
float32 bullet_speed\n\
float32 shooter_remain_heat\n\
float32 shooter_max_heat\n\
";
  }

  static const char* value(const ::roborts_msgs::referee_system_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::roborts_msgs::referee_system_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.armor_hurt_id);
      stream.next(m.remain_HP);
      stream.next(m.max_HP);
      stream.next(m.bullet_speed);
      stream.next(m.shooter_remain_heat);
      stream.next(m.shooter_max_heat);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct referee_system_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::roborts_msgs::referee_system_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::roborts_msgs::referee_system_<ContainerAllocator>& v)
  {
    s << indent << "armor_hurt_id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.armor_hurt_id);
    s << indent << "remain_HP: ";
    Printer<int16_t>::stream(s, indent + "  ", v.remain_HP);
    s << indent << "max_HP: ";
    Printer<int16_t>::stream(s, indent + "  ", v.max_HP);
    s << indent << "bullet_speed: ";
    Printer<float>::stream(s, indent + "  ", v.bullet_speed);
    s << indent << "shooter_remain_heat: ";
    Printer<float>::stream(s, indent + "  ", v.shooter_remain_heat);
    s << indent << "shooter_max_heat: ";
    Printer<float>::stream(s, indent + "  ", v.shooter_max_heat);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBORTS_MSGS_MESSAGE_REFEREE_SYSTEM_H
