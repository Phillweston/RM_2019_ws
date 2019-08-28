;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::chassis_info)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'chassis_info (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::CHASSIS_INFO")
  (make-package "ROBORTS_MSGS::CHASSIS_INFO"))

(in-package "ROS")
;;//! \htmlinclude chassis_info.msg.html


(defclass roborts_msgs::chassis_info
  :super ros::object
  :slots (_chassis_mode _chassis_x _chassis_y _chassis_r ))

(defmethod roborts_msgs::chassis_info
  (:init
   (&key
    ((:chassis_mode __chassis_mode) 0)
    ((:chassis_x __chassis_x) 0.0)
    ((:chassis_y __chassis_y) 0.0)
    ((:chassis_r __chassis_r) 0.0)
    )
   (send-super :init)
   (setq _chassis_mode (round __chassis_mode))
   (setq _chassis_x (float __chassis_x))
   (setq _chassis_y (float __chassis_y))
   (setq _chassis_r (float __chassis_r))
   self)
  (:chassis_mode
   (&optional __chassis_mode)
   (if __chassis_mode (setq _chassis_mode __chassis_mode)) _chassis_mode)
  (:chassis_x
   (&optional __chassis_x)
   (if __chassis_x (setq _chassis_x __chassis_x)) _chassis_x)
  (:chassis_y
   (&optional __chassis_y)
   (if __chassis_y (setq _chassis_y __chassis_y)) _chassis_y)
  (:chassis_r
   (&optional __chassis_r)
   (if __chassis_r (setq _chassis_r __chassis_r)) _chassis_r)
  (:serialization-length
   ()
   (+
    ;; uint8 _chassis_mode
    1
    ;; float32 _chassis_x
    4
    ;; float32 _chassis_y
    4
    ;; float32 _chassis_r
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _chassis_mode
       (write-byte _chassis_mode s)
     ;; float32 _chassis_x
       (sys::poke _chassis_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassis_y
       (sys::poke _chassis_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _chassis_r
       (sys::poke _chassis_r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _chassis_mode
     (setq _chassis_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _chassis_x
     (setq _chassis_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassis_y
     (setq _chassis_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _chassis_r
     (setq _chassis_r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roborts_msgs::chassis_info :md5sum-) "1f7db8c7808f9a47fe9116576ce31396")
(setf (get roborts_msgs::chassis_info :datatype-) "roborts_msgs/chassis_info")
(setf (get roborts_msgs::chassis_info :definition-)
      "uint8   chassis_mode
float32 chassis_x
float32 chassis_y
float32 chassis_r
")



(provide :roborts_msgs/chassis_info "1f7db8c7808f9a47fe9116576ce31396")


