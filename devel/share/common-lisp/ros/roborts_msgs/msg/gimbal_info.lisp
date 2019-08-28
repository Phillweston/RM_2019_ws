; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude gimbal_info.msg.html

(cl:defclass <gimbal_info> (roslisp-msg-protocol:ros-message)
  ((gimbal_mode
    :reader gimbal_mode
    :initarg :gimbal_mode
    :type cl:fixnum
    :initform 0)
   (gimbal_yaw
    :reader gimbal_yaw
    :initarg :gimbal_yaw
    :type cl:float
    :initform 0.0)
   (gimbal_pitch
    :reader gimbal_pitch
    :initarg :gimbal_pitch
    :type cl:float
    :initform 0.0))
)

(cl:defclass gimbal_info (<gimbal_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbal_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbal_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<gimbal_info> is deprecated: use roborts_msgs-msg:gimbal_info instead.")))

(cl:ensure-generic-function 'gimbal_mode-val :lambda-list '(m))
(cl:defmethod gimbal_mode-val ((m <gimbal_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:gimbal_mode-val is deprecated.  Use roborts_msgs-msg:gimbal_mode instead.")
  (gimbal_mode m))

(cl:ensure-generic-function 'gimbal_yaw-val :lambda-list '(m))
(cl:defmethod gimbal_yaw-val ((m <gimbal_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:gimbal_yaw-val is deprecated.  Use roborts_msgs-msg:gimbal_yaw instead.")
  (gimbal_yaw m))

(cl:ensure-generic-function 'gimbal_pitch-val :lambda-list '(m))
(cl:defmethod gimbal_pitch-val ((m <gimbal_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:gimbal_pitch-val is deprecated.  Use roborts_msgs-msg:gimbal_pitch instead.")
  (gimbal_pitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbal_info>) ostream)
  "Serializes a message object of type '<gimbal_info>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gimbal_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gimbal_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gimbal_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbal_info>) istream)
  "Deserializes a message object of type '<gimbal_info>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gimbal_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gimbal_yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gimbal_pitch) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbal_info>)))
  "Returns string type for a message object of type '<gimbal_info>"
  "roborts_msgs/gimbal_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbal_info)))
  "Returns string type for a message object of type 'gimbal_info"
  "roborts_msgs/gimbal_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbal_info>)))
  "Returns md5sum for a message object of type '<gimbal_info>"
  "ff1dad119a0d9688115465f7f16fbe0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbal_info)))
  "Returns md5sum for a message object of type 'gimbal_info"
  "ff1dad119a0d9688115465f7f16fbe0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbal_info>)))
  "Returns full string definition for message of type '<gimbal_info>"
  (cl:format cl:nil "uint8   gimbal_mode~%float32 gimbal_yaw~%float32 gimbal_pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbal_info)))
  "Returns full string definition for message of type 'gimbal_info"
  (cl:format cl:nil "uint8   gimbal_mode~%float32 gimbal_yaw~%float32 gimbal_pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbal_info>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbal_info>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbal_info
    (cl:cons ':gimbal_mode (gimbal_mode msg))
    (cl:cons ':gimbal_yaw (gimbal_yaw msg))
    (cl:cons ':gimbal_pitch (gimbal_pitch msg))
))
