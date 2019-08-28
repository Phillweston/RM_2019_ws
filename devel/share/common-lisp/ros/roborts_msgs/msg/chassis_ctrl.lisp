; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude chassis_ctrl.msg.html

(cl:defclass <chassis_ctrl> (roslisp-msg-protocol:ros-message)
  ((cmd_chassis_mode
    :reader cmd_chassis_mode
    :initarg :cmd_chassis_mode
    :type cl:fixnum
    :initform 0)
   (cmd_chassis_x
    :reader cmd_chassis_x
    :initarg :cmd_chassis_x
    :type cl:float
    :initform 0.0)
   (cmd_chassis_y
    :reader cmd_chassis_y
    :initarg :cmd_chassis_y
    :type cl:float
    :initform 0.0)
   (cmd_chassis_r
    :reader cmd_chassis_r
    :initarg :cmd_chassis_r
    :type cl:float
    :initform 0.0))
)

(cl:defclass chassis_ctrl (<chassis_ctrl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <chassis_ctrl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'chassis_ctrl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<chassis_ctrl> is deprecated: use roborts_msgs-msg:chassis_ctrl instead.")))

(cl:ensure-generic-function 'cmd_chassis_mode-val :lambda-list '(m))
(cl:defmethod cmd_chassis_mode-val ((m <chassis_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_chassis_mode-val is deprecated.  Use roborts_msgs-msg:cmd_chassis_mode instead.")
  (cmd_chassis_mode m))

(cl:ensure-generic-function 'cmd_chassis_x-val :lambda-list '(m))
(cl:defmethod cmd_chassis_x-val ((m <chassis_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_chassis_x-val is deprecated.  Use roborts_msgs-msg:cmd_chassis_x instead.")
  (cmd_chassis_x m))

(cl:ensure-generic-function 'cmd_chassis_y-val :lambda-list '(m))
(cl:defmethod cmd_chassis_y-val ((m <chassis_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_chassis_y-val is deprecated.  Use roborts_msgs-msg:cmd_chassis_y instead.")
  (cmd_chassis_y m))

(cl:ensure-generic-function 'cmd_chassis_r-val :lambda-list '(m))
(cl:defmethod cmd_chassis_r-val ((m <chassis_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_chassis_r-val is deprecated.  Use roborts_msgs-msg:cmd_chassis_r instead.")
  (cmd_chassis_r m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <chassis_ctrl>) ostream)
  "Serializes a message object of type '<chassis_ctrl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_chassis_mode)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_chassis_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_chassis_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_chassis_r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <chassis_ctrl>) istream)
  "Deserializes a message object of type '<chassis_ctrl>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_chassis_mode)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_chassis_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_chassis_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_chassis_r) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<chassis_ctrl>)))
  "Returns string type for a message object of type '<chassis_ctrl>"
  "roborts_msgs/chassis_ctrl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'chassis_ctrl)))
  "Returns string type for a message object of type 'chassis_ctrl"
  "roborts_msgs/chassis_ctrl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<chassis_ctrl>)))
  "Returns md5sum for a message object of type '<chassis_ctrl>"
  "d718a58c641ad306069461333848a771")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'chassis_ctrl)))
  "Returns md5sum for a message object of type 'chassis_ctrl"
  "d718a58c641ad306069461333848a771")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<chassis_ctrl>)))
  "Returns full string definition for message of type '<chassis_ctrl>"
  (cl:format cl:nil "uint8   cmd_chassis_mode~%float32 cmd_chassis_x~%float32 cmd_chassis_y~%float32 cmd_chassis_r~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'chassis_ctrl)))
  "Returns full string definition for message of type 'chassis_ctrl"
  (cl:format cl:nil "uint8   cmd_chassis_mode~%float32 cmd_chassis_x~%float32 cmd_chassis_y~%float32 cmd_chassis_r~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <chassis_ctrl>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <chassis_ctrl>))
  "Converts a ROS message object to a list"
  (cl:list 'chassis_ctrl
    (cl:cons ':cmd_chassis_mode (cmd_chassis_mode msg))
    (cl:cons ':cmd_chassis_x (cmd_chassis_x msg))
    (cl:cons ':cmd_chassis_y (cmd_chassis_y msg))
    (cl:cons ':cmd_chassis_r (cmd_chassis_r msg))
))
