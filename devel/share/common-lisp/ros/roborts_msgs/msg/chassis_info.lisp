; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude chassis_info.msg.html

(cl:defclass <chassis_info> (roslisp-msg-protocol:ros-message)
  ((chassis_mode
    :reader chassis_mode
    :initarg :chassis_mode
    :type cl:fixnum
    :initform 0)
   (chassis_x
    :reader chassis_x
    :initarg :chassis_x
    :type cl:float
    :initform 0.0)
   (chassis_y
    :reader chassis_y
    :initarg :chassis_y
    :type cl:float
    :initform 0.0)
   (chassis_r
    :reader chassis_r
    :initarg :chassis_r
    :type cl:float
    :initform 0.0))
)

(cl:defclass chassis_info (<chassis_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chassis_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chassis_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<chassis_info> is deprecated: use roborts_msgs-msg:chassis_info instead.")))

(cl:ensure-generic-function 'chassis_mode-val :lambda-list '(m))
(cl:defmethod chassis_mode-val ((m <chassis_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_mode-val is deprecated.  Use roborts_msgs-msg:chassis_mode instead.")
  (chassis_mode m))

(cl:ensure-generic-function 'chassis_x-val :lambda-list '(m))
(cl:defmethod chassis_x-val ((m <chassis_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_x-val is deprecated.  Use roborts_msgs-msg:chassis_x instead.")
  (chassis_x m))

(cl:ensure-generic-function 'chassis_y-val :lambda-list '(m))
(cl:defmethod chassis_y-val ((m <chassis_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_y-val is deprecated.  Use roborts_msgs-msg:chassis_y instead.")
  (chassis_y m))

(cl:ensure-generic-function 'chassis_r-val :lambda-list '(m))
(cl:defmethod chassis_r-val ((m <chassis_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:chassis_r-val is deprecated.  Use roborts_msgs-msg:chassis_r instead.")
  (chassis_r m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chassis_info>) ostream)
  "Serializes a message object of type '<chassis_info>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'chassis_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'chassis_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'chassis_r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chassis_info>) istream)
  "Deserializes a message object of type '<chassis_info>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'chassis_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassis_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassis_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'chassis_r) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chassis_info>)))
  "Returns string type for a message object of type '<chassis_info>"
  "roborts_msgs/chassis_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chassis_info)))
  "Returns string type for a message object of type 'chassis_info"
  "roborts_msgs/chassis_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chassis_info>)))
  "Returns md5sum for a message object of type '<chassis_info>"
  "1f7db8c7808f9a47fe9116576ce31396")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chassis_info)))
  "Returns md5sum for a message object of type 'chassis_info"
  "1f7db8c7808f9a47fe9116576ce31396")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chassis_info>)))
  "Returns full string definition for message of type '<chassis_info>"
  (cl:format cl:nil "uint8   chassis_mode~%float32 chassis_x~%float32 chassis_y~%float32 chassis_r~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chassis_info)))
  "Returns full string definition for message of type 'chassis_info"
  (cl:format cl:nil "uint8   chassis_mode~%float32 chassis_x~%float32 chassis_y~%float32 chassis_r~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chassis_info>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chassis_info>))
  "Converts a ROS message object to a list"
  (cl:list 'chassis_info
    (cl:cons ':chassis_mode (chassis_mode msg))
    (cl:cons ':chassis_x (chassis_x msg))
    (cl:cons ':chassis_y (chassis_y msg))
    (cl:cons ':chassis_r (chassis_r msg))
))
