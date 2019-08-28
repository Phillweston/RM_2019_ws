; Auto-generated. Do not edit!


(cl:in-package roborts_msgs-msg)


;//! \htmlinclude referee_system.msg.html

(cl:defclass <referee_system> (roslisp-msg-protocol:ros-message)
  ((armor_hurt_id
    :reader armor_hurt_id
    :initarg :armor_hurt_id
    :type cl:fixnum
    :initform 0)
   (remain_HP
    :reader remain_HP
    :initarg :remain_HP
    :type cl:fixnum
    :initform 0)
   (max_HP
    :reader max_HP
    :initarg :max_HP
    :type cl:fixnum
    :initform 0)
   (bullet_speed
    :reader bullet_speed
    :initarg :bullet_speed
    :type cl:float
    :initform 0.0)
   (shooter_remain_heat
    :reader shooter_remain_heat
    :initarg :shooter_remain_heat
    :type cl:float
    :initform 0.0)
   (shooter_max_heat
    :reader shooter_max_heat
    :initarg :shooter_max_heat
    :type cl:float
    :initform 0.0))
)

(cl:defclass referee_system (<referee_system>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <referee_system>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'referee_system)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roborts_msgs-msg:<referee_system> is deprecated: use roborts_msgs-msg:referee_system instead.")))

(cl:ensure-generic-function 'armor_hurt_id-val :lambda-list '(m))
(cl:defmethod armor_hurt_id-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:armor_hurt_id-val is deprecated.  Use roborts_msgs-msg:armor_hurt_id instead.")
  (armor_hurt_id m))

(cl:ensure-generic-function 'remain_HP-val :lambda-list '(m))
(cl:defmethod remain_HP-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:remain_HP-val is deprecated.  Use roborts_msgs-msg:remain_HP instead.")
  (remain_HP m))

(cl:ensure-generic-function 'max_HP-val :lambda-list '(m))
(cl:defmethod max_HP-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:max_HP-val is deprecated.  Use roborts_msgs-msg:max_HP instead.")
  (max_HP m))

(cl:ensure-generic-function 'bullet_speed-val :lambda-list '(m))
(cl:defmethod bullet_speed-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:bullet_speed-val is deprecated.  Use roborts_msgs-msg:bullet_speed instead.")
  (bullet_speed m))

(cl:ensure-generic-function 'shooter_remain_heat-val :lambda-list '(m))
(cl:defmethod shooter_remain_heat-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:shooter_remain_heat-val is deprecated.  Use roborts_msgs-msg:shooter_remain_heat instead.")
  (shooter_remain_heat m))

(cl:ensure-generic-function 'shooter_max_heat-val :lambda-list '(m))
(cl:defmethod shooter_max_heat-val ((m <referee_system>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roborts_msgs-msg:shooter_max_heat-val is deprecated.  Use roborts_msgs-msg:shooter_max_heat instead.")
  (shooter_max_heat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <referee_system>) ostream)
  "Serializes a message object of type '<referee_system>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'armor_hurt_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'remain_HP)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'max_HP)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bullet_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'shooter_remain_heat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'shooter_max_heat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <referee_system>) istream)
  "Deserializes a message object of type '<referee_system>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'armor_hurt_id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'remain_HP) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'max_HP) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bullet_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shooter_remain_heat) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'shooter_max_heat) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<referee_system>)))
  "Returns string type for a message object of type '<referee_system>"
  "roborts_msgs/referee_system")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'referee_system)))
  "Returns string type for a message object of type 'referee_system"
  "roborts_msgs/referee_system")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<referee_system>)))
  "Returns md5sum for a message object of type '<referee_system>"
  "358d70f927f6ebe96797d1e067a0a634")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'referee_system)))
  "Returns md5sum for a message object of type 'referee_system"
  "358d70f927f6ebe96797d1e067a0a634")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<referee_system>)))
  "Returns full string definition for message of type '<referee_system>"
  (cl:format cl:nil "uint8   armor_hurt_id~%int16   remain_HP~%int16   max_HP~%float32 bullet_speed~%float32 shooter_remain_heat~%float32 shooter_max_heat~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'referee_system)))
  "Returns full string definition for message of type 'referee_system"
  (cl:format cl:nil "uint8   armor_hurt_id~%int16   remain_HP~%int16   max_HP~%float32 bullet_speed~%float32 shooter_remain_heat~%float32 shooter_max_heat~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <referee_system>))
  (cl:+ 0
     1
     2
     2
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <referee_system>))
  "Converts a ROS message object to a list"
  (cl:list 'referee_system
    (cl:cons ':armor_hurt_id (armor_hurt_id msg))
    (cl:cons ':remain_HP (remain_HP msg))
    (cl:cons ':max_HP (max_HP msg))
    (cl:cons ':bullet_speed (bullet_speed msg))
    (cl:cons ':shooter_remain_heat (shooter_remain_heat msg))
    (cl:cons ':shooter_max_heat (shooter_max_heat msg))
))
