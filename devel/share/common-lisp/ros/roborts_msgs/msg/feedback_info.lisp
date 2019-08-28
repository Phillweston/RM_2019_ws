; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude feedback_info.msg.html

(cl:defclass <feedback_info> (roslisp-msg-protocol:ros-message)
  ((cmd_mode
    :reader cmd_mode
    :initarg :cmd_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass feedback_info (<feedback_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <feedback_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'feedback_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<feedback_info> is deprecated: use roborts_msgs-msg:feedback_info instead.")))

(cl:ensure-generic-function 'cmd_mode-val :lambda-list '(m))
(cl:defmethod cmd_mode-val ((m <feedback_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:cmd_mode-val is deprecated.  Use roborts_msgs-msg:cmd_mode instead.")
  (cmd_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <feedback_info>) ostream)
  "Serializes a message object of type '<feedback_info>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <feedback_info>) istream)
  "Deserializes a message object of type '<feedback_info>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<feedback_info>)))
  "Returns string type for a message object of type '<feedback_info>"
  "roborts_msgs/feedback_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'feedback_info)))
  "Returns string type for a message object of type 'feedback_info"
  "roborts_msgs/feedback_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<feedback_info>)))
  "Returns md5sum for a message object of type '<feedback_info>"
  "418ed2d86b8db9916390cc3f18d9d630")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedback_info)))
  "Returns md5sum for a message object of type 'feedback_info"
  "418ed2d86b8db9916390cc3f18d9d630")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedback_info>)))
  "Returns full string definition for message of type '<feedback_info>"
  (cl:format cl:nil "uint8   cmd_mode~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedback_info)))
  "Returns full string definition for message of type 'feedback_info"
  (cl:format cl:nil "uint8   cmd_mode~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <feedback_info>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <feedback_info>))
  "Converts a ROS message object to a list"
  (cl:list 'feedback_info
    (cl:cons ':cmd_mode (cmd_mode msg))
))
