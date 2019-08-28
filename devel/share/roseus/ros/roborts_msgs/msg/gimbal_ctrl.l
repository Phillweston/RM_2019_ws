;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::gimbal_ctrl)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'gimbal_ctrl (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::GIMBAL_CTRL")
  (make-package "ROBORTS_MSGS::GIMBAL_CTRL"))

(in-package "ROS")
;;//! \htmlinclude gimbal_ctrl.msg.html


(defclass roborts_msgs::gimbal_ctrl
  :super ros::object
  :slots (_cmd_gimbal_mode _cmd_gimbal_yaw _cmd_gimbal_pitch _cmd_gimbal_fric_speed ))

(defmethod roborts_msgs::gimbal_ctrl
  (:init
   (&key
    ((:cmd_gimbal_mode __cmd_gimbal_mode) 0)
    ((:cmd_gimbal_yaw __cmd_gimbal_yaw) 0.0)
    ((:cmd_gimbal_pitch __cmd_gimbal_pitch) 0.0)
    ((:cmd_gimbal_fric_speed __cmd_gimbal_fric_speed) 0)
    )
   (send-super :init)
   (setq _cmd_gimbal_mode (round __cmd_gimbal_mode))
   (setq _cmd_gimbal_yaw (float __cmd_gimbal_yaw))
   (setq _cmd_gimbal_pitch (float __cmd_gimbal_pitch))
   (setq _cmd_gimbal_fric_speed (round __cmd_gimbal_fric_speed))
   self)
  (:cmd_gimbal_mode
   (&optional __cmd_gimbal_mode)
   (if __cmd_gimbal_mode (setq _cmd_gimbal_mode __cmd_gimbal_mode)) _cmd_gimbal_mode)
  (:cmd_gimbal_yaw
   (&optional __cmd_gimbal_yaw)
   (if __cmd_gimbal_yaw (setq _cmd_gimbal_yaw __cmd_gimbal_yaw)) _cmd_gimbal_yaw)
  (:cmd_gimbal_pitch
   (&optional __cmd_gimbal_pitch)
   (if __cmd_gimbal_pitch (setq _cmd_gimbal_pitch __cmd_gimbal_pitch)) _cmd_gimbal_pitch)
  (:cmd_gimbal_fric_speed
   (&optional __cmd_gimbal_fric_speed)
   (if __cmd_gimbal_fric_speed (setq _cmd_gimbal_fric_speed __cmd_gimbal_fric_speed)) _cmd_gimbal_fric_speed)
  (:serialization-length
   ()
   (+
    ;; uint8 _cmd_gimbal_mode
    1
    ;; float32 _cmd_gimbal_yaw
    4
    ;; float32 _cmd_gimbal_pitch
    4
    ;; uint8 _cmd_gimbal_fric_speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _cmd_gimbal_mode
       (write-byte _cmd_gimbal_mode s)
     ;; float32 _cmd_gimbal_yaw
       (sys::poke _cmd_gimbal_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cmd_gimbal_pitch
       (sys::poke _cmd_gimbal_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _cmd_gimbal_fric_speed
       (write-byte _cmd_gimbal_fric_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _cmd_gimbal_mode
     (setq _cmd_gimbal_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _cmd_gimbal_yaw
     (setq _cmd_gimbal_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cmd_gimbal_pitch
     (setq _cmd_gimbal_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _cmd_gimbal_fric_speed
     (setq _cmd_gimbal_fric_speed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get roborts_msgs::gimbal_ctrl :md5sum-) "31acb477b7f21d2e6fa8ecbdc101a6b4")
(setf (get roborts_msgs::gimbal_ctrl :datatype-) "roborts_msgs/gimbal_ctrl")
(setf (get roborts_msgs::gimbal_ctrl :definition-)
      "uint8   cmd_gimbal_mode
float32 cmd_gimbal_yaw
float32 cmd_gimbal_pitch
uint8   cmd_gimbal_fric_speed
")



(provide :roborts_msgs/gimbal_ctrl "31acb477b7f21d2e6fa8ecbdc101a6b4")


