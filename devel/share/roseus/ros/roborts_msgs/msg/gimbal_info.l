;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::gimbal_info)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'gimbal_info (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::GIMBAL_INFO")
  (make-package "ROBORTS_MSGS::GIMBAL_INFO"))

(in-package "ROS")
;;//! \htmlinclude gimbal_info.msg.html


(defclass roborts_msgs::gimbal_info
  :super ros::object
  :slots (_gimbal_mode _gimbal_yaw _gimbal_pitch ))

(defmethod roborts_msgs::gimbal_info
  (:init
   (&key
    ((:gimbal_mode __gimbal_mode) 0)
    ((:gimbal_yaw __gimbal_yaw) 0.0)
    ((:gimbal_pitch __gimbal_pitch) 0.0)
    )
   (send-super :init)
   (setq _gimbal_mode (round __gimbal_mode))
   (setq _gimbal_yaw (float __gimbal_yaw))
   (setq _gimbal_pitch (float __gimbal_pitch))
   self)
  (:gimbal_mode
   (&optional __gimbal_mode)
   (if __gimbal_mode (setq _gimbal_mode __gimbal_mode)) _gimbal_mode)
  (:gimbal_yaw
   (&optional __gimbal_yaw)
   (if __gimbal_yaw (setq _gimbal_yaw __gimbal_yaw)) _gimbal_yaw)
  (:gimbal_pitch
   (&optional __gimbal_pitch)
   (if __gimbal_pitch (setq _gimbal_pitch __gimbal_pitch)) _gimbal_pitch)
  (:serialization-length
   ()
   (+
    ;; uint8 _gimbal_mode
    1
    ;; float32 _gimbal_yaw
    4
    ;; float32 _gimbal_pitch
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _gimbal_mode
       (write-byte _gimbal_mode s)
     ;; float32 _gimbal_yaw
       (sys::poke _gimbal_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gimbal_pitch
       (sys::poke _gimbal_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _gimbal_mode
     (setq _gimbal_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _gimbal_yaw
     (setq _gimbal_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gimbal_pitch
     (setq _gimbal_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roborts_msgs::gimbal_info :md5sum-) "ff1dad119a0d9688115465f7f16fbe0b")
(setf (get roborts_msgs::gimbal_info :datatype-) "roborts_msgs/gimbal_info")
(setf (get roborts_msgs::gimbal_info :definition-)
      "uint8   gimbal_mode
float32 gimbal_yaw
float32 gimbal_pitch
")



(provide :roborts_msgs/gimbal_info "ff1dad119a0d9688115465f7f16fbe0b")


