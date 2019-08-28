; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude gimbal_ctrl.msg.html

(cl:defclass <gimbal_ctrl> (roslisp-msg-protocol:ros-message)
  ((cmd_gimbal_mode
    :reader cmd_gimbal_mode
    :initarg :cmd_gimbal_mode
    :type cl:fixnum
    :initform 0)
   (cmd_gimbal_yaw
    :reader cmd_gimbal_yaw
    :initarg :cmd_gimbal_yaw
    :type cl:float
    :initform 0.0)
   (cmd_gimbal_pitch
    :reader cmd_gimbal_pitch
    :initarg :cmd_gimbal_pitch
    :type cl:float
    :initform 0.0)
   (cmd_gimbal_fric_speed
    :reader cmd_gimbal_fric_speed
    :initarg :cmd_gimbal_fric_speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass gimbal_ctrl (<gimbal_ctrl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbal_ctrl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbal_ctrl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<gimbal_ctrl> is deprecated: use roborts_msgs-msg:gimbal_ctrl instead.")))

(cl:ensure-generic-function 'cmd_gimbal_mode-val :lambda-list '(m))
(cl:defmethod cmd_gimbal_mode-val ((m <gimbal_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_gimbal_mode-val is deprecated.  Use roborts_msgs-msg:cmd_gimbal_mode instead.")
  (cmd_gimbal_mode m))

(cl:ensure-generic-function 'cmd_gimbal_yaw-val :lambda-list '(m))
(cl:defmethod cmd_gimbal_yaw-val ((m <gimbal_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_gimbal_yaw-val is deprecated.  Use roborts_msgs-msg:cmd_gimbal_yaw instead.")
  (cmd_gimbal_yaw m))

(cl:ensure-generic-function 'cmd_gimbal_pitch-val :lambda-list '(m))
(cl:defmethod cmd_gimbal_pitch-val ((m <gimbal_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_gimbal_pitch-val is deprecated.  Use roborts_msgs-msg:cmd_gimbal_pitch instead.")
  (cmd_gimbal_pitch m))

(cl:ensure-generic-function 'cmd_gimbal_fric_speed-val :lambda-list '(m))
(cl:defmethod cmd_gimbal_fric_speed-val ((m <gimbal_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_gimbal_fric_speed-val is deprecated.  Use roborts_msgs-msg:cmd_gimbal_fric_speed instead.")
  (cmd_gimbal_fric_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbal_ctrl>) ostream)
  "Serializes a message object of type '<gimbal_ctrl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_gimbal_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_gimbal_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_gimbal_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_gimbal_fric_speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbal_ctrl>) istream)
  "Deserializes a message object of type '<gimbal_ctrl>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_gimbal_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_gimbal_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_gimbal_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_gimbal_fric_speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbal_ctrl>)))
  "Returns string type for a message object of type '<gimbal_ctrl>"
  "roborts_msgs/gimbal_ctrl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbal_ctrl)))
  "Returns string type for a message object of type 'gimbal_ctrl"
  "roborts_msgs/gimbal_ctrl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbal_ctrl>)))
  "Returns md5sum for a message object of type '<gimbal_ctrl>"
  "31acb477b7f21d2e6fa8ecbdc101a6b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbal_ctrl)))
  "Returns md5sum for a message object of type 'gimbal_ctrl"
  "31acb477b7f21d2e6fa8ecbdc101a6b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbal_ctrl>)))
  "Returns full string definition for message of type '<gimbal_ctrl>"
  (cl:format cl:nil "uint8   cmd_gimbal_mode~%float32 cmd_gimbal_yaw~%float32 cmd_gimbal_pitch~%uint8   cmd_gimbal_fric_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbal_ctrl)))
  "Returns full string definition for message of type 'gimbal_ctrl"
  (cl:format cl:nil "uint8   cmd_gimbal_mode~%float32 cmd_gimbal_yaw~%float32 cmd_gimbal_pitch~%uint8   cmd_gimbal_fric_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbal_ctrl>))
  (cl:+ 0
     1
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbal_ctrl>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbal_ctrl
    (cl:cons ':cmd_gimbal_mode (cmd_gimbal_mode msg))
    (cl:cons ':cmd_gimbal_yaw (cmd_gimbal_yaw msg))
    (cl:cons ':cmd_gimbal_pitch (cmd_gimbal_pitch msg))
    (cl:cons ':cmd_gimbal_fric_speed (cmd_gimbal_fric_speed msg))
))
