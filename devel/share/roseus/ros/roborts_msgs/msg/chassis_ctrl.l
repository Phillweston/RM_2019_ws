;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::chassis_ctrl)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'chassis_ctrl (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::CHASSIS_CTRL")
  (make-package "ROBORTS_MSGS::CHASSIS_CTRL"))

(in-package "ROS")
;;//! \htmlinclude chassis_ctrl.msg.html


(defclass roborts_msgs::chassis_ctrl
  :super ros::object
  :slots (_cmd_chassis_mode _cmd_chassis_x _cmd_chassis_y _cmd_chassis_r ))

(defmethod roborts_msgs::chassis_ctrl
  (:init
   (&key
    ((:cmd_chassis_mode __cmd_chassis_mode) 0)
    ((:cmd_chassis_x __cmd_chassis_x) 0.0)
    ((:cmd_chassis_y __cmd_chassis_y) 0.0)
    ((:cmd_chassis_r __cmd_chassis_r) 0.0)
    )
   (send-super :init)
   (setq _cmd_chassis_mode (round __cmd_chassis_mode))
   (setq _cmd_chassis_x (float __cmd_chassis_x))
   (setq _cmd_chassis_y (float __cmd_chassis_y))
   (setq _cmd_chassis_r (float __cmd_chassis_r))
   self)
  (:cmd_chassis_mode
   (&optional __cmd_chassis_mode)
   (if __cmd_chassis_mode (setq _cmd_chassis_mode __cmd_chassis_mode)) _cmd_chassis_mode)
  (:cmd_chassis_x
   (&optional __cmd_chassis_x)
   (if __cmd_chassis_x (setq _cmd_chassis_x __cmd_chassis_x)) _cmd_chassis_x)
  (:cmd_chassis_y
   (&optional __cmd_chassis_y)
   (if __cmd_chassis_y (setq _cmd_chassis_y __cmd_chassis_y)) _cmd_chassis_y)
  (:cmd_chassis_r
   (&optional __cmd_chassis_r)
   (if __cmd_chassis_r (setq _cmd_chassis_r __cmd_chassis_r)) _cmd_chassis_r)
  (:serialization-length
   ()
   (+
    ;; uint8 _cmd_chassis_mode
    1
    ;; float32 _cmd_chassis_x
    4
    ;; float32 _cmd_chassis_y
    4
    ;; float32 _cmd_chassis_r
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _cmd_chassis_mode
       (write-byte _cmd_chassis_mode s)
     ;; float32 _cmd_chassis_x
       (sys::poke _cmd_chassis_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cmd_chassis_y
       (sys::poke _cmd_chassis_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cmd_chassis_r
       (sys::poke _cmd_chassis_r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _cmd_chassis_mode
     (setq _cmd_chassis_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _cmd_chassis_x
     (setq _cmd_chassis_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cmd_chassis_y
     (setq _cmd_chassis_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cmd_chassis_r
     (setq _cmd_chassis_r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roborts_msgs::chassis_ctrl :md5sum-) "d718a58c641ad306069461333848a771")
(setf (get roborts_msgs::chassis_ctrl :datatype-) "roborts_msgs/chassis_ctrl")
(setf (get roborts_msgs::chassis_ctrl :definition-)
      "uint8   cmd_chassis_mode
float32 cmd_chassis_x
float32 cmd_chassis_y
float32 cmd_chassis_r
")



(provide :roborts_msgs/chassis_ctrl "d718a58c641ad306069461333848a771")


