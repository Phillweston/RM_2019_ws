; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude feedback_ctrl.msg.html

(cl:defclass <feedback_ctrl> (roslisp-msg-protocol:ros-message)
  ((task_id
    :reader task_id
    :initarg :task_id
    :type cl:fixnum
    :initform 0)
   (vision_data_status
    :reader vision_data_status
    :initarg :vision_data_status
    :type cl:fixnum
    :initform 0)
   (vision_data_x
    :reader vision_data_x
    :initarg :vision_data_x
    :type cl:float
    :initform 0.0)
   (vision_data_y
    :reader vision_data_y
    :initarg :vision_data_y
    :type cl:float
    :initform 0.0)
   (vision_data_z
    :reader vision_data_z
    :initarg :vision_data_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass feedback_ctrl (<feedback_ctrl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <feedback_ctrl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'feedback_ctrl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<feedback_ctrl> is deprecated: use roborts_msgs-msg:feedback_ctrl instead.")))

(cl:ensure-generic-function 'task_id-val :lambda-list '(m))
(cl:defmethod task_id-val ((m <feedback_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:task_id-val is deprecated.  Use roborts_msgs-msg:task_id instead.")
  (task_id m))

(cl:ensure-generic-function 'vision_data_status-val :lambda-list '(m))
(cl:defmethod vision_data_status-val ((m <feedback_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:vision_data_status-val is deprecated.  Use roborts_msgs-msg:vision_data_status instead.")
  (vision_data_status m))

(cl:ensure-generic-function 'vision_data_x-val :lambda-list '(m))
(cl:defmethod vision_data_x-val ((m <feedback_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:vision_data_x-val is deprecated.  Use roborts_msgs-msg:vision_data_x instead.")
  (vision_data_x m))

(cl:ensure-generic-function 'vision_data_y-val :lambda-list '(m))
(cl:defmethod vision_data_y-val ((m <feedback_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:vision_data_y-val is deprecated.  Use roborts_msgs-msg:vision_data_y instead.")
  (vision_data_y m))

(cl:ensure-generic-function 'vision_data_z-val :lambda-list '(m))
(cl:defmethod vision_data_z-val ((m <feedback_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:vision_data_z-val is deprecated.  Use roborts_msgs-msg:vision_data_z instead.")
  (vision_data_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <feedback_ctrl>) ostream)
  "Serializes a message object of type '<feedback_ctrl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vision_data_status)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vision_data_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vision_data_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vision_data_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <feedback_ctrl>) istream)
  "Deserializes a message object of type '<feedback_ctrl>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vision_data_status)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vision_data_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vision_data_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vision_data_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<feedback_ctrl>)))
  "Returns string type for a message object of type '<feedback_ctrl>"
  "roborts_msgs/feedback_ctrl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'feedback_ctrl)))
  "Returns string type for a message object of type 'feedback_ctrl"
  "roborts_msgs/feedback_ctrl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<feedback_ctrl>)))
  "Returns md5sum for a message object of type '<feedback_ctrl>"
  "68a1b9aca52b30f74d28848b0013eff7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedback_ctrl)))
  "Returns md5sum for a message object of type 'feedback_ctrl"
  "68a1b9aca52b30f74d28848b0013eff7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedback_ctrl>)))
  "Returns full string definition for message of type '<feedback_ctrl>"
  (cl:format cl:nil "uint8   task_id~%uint8   vision_data_status~%float32 vision_data_x~%float32 vision_data_y~%float32 vision_data_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedback_ctrl)))
  "Returns full string definition for message of type 'feedback_ctrl"
  (cl:format cl:nil "uint8   task_id~%uint8   vision_data_status~%float32 vision_data_x~%float32 vision_data_y~%float32 vision_data_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <feedback_ctrl>))
  (cl:+ 0
     1
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <feedback_ctrl>))
  "Converts a ROS message object to a list"
  (cl:list 'feedback_ctrl
    (cl:cons ':task_id (task_id msg))
    (cl:cons ':vision_data_status (vision_data_status msg))
    (cl:cons ':vision_data_x (vision_data_x msg))
    (cl:cons ':vision_data_y (vision_data_y msg))
    (cl:cons ':vision_data_z (vision_data_z msg))
))
