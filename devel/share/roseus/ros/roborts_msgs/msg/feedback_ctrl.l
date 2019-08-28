;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::feedback_ctrl)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'feedback_ctrl (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::FEEDBACK_CTRL")
  (make-package "ROBORTS_MSGS::FEEDBACK_CTRL"))

(in-package "ROS")
;;//! \htmlinclude feedback_ctrl.msg.html


(defclass roborts_msgs::feedback_ctrl
  :super ros::object
  :slots (_task_id _vision_data_status _vision_data_x _vision_data_y _vision_data_z ))

(defmethod roborts_msgs::feedback_ctrl
  (:init
   (&key
    ((:task_id __task_id) 0)
    ((:vision_data_status __vision_data_status) 0)
    ((:vision_data_x __vision_data_x) 0.0)
    ((:vision_data_y __vision_data_y) 0.0)
    ((:vision_data_z __vision_data_z) 0.0)
    )
   (send-super :init)
   (setq _task_id (round __task_id))
   (setq _vision_data_status (round __vision_data_status))
   (setq _vision_data_x (float __vision_data_x))
   (setq _vision_data_y (float __vision_data_y))
   (setq _vision_data_z (float __vision_data_z))
   self)
  (:task_id
   (&optional __task_id)
   (if __task_id (setq _task_id __task_id)) _task_id)
  (:vision_data_status
   (&optional __vision_data_status)
   (if __vision_data_status (setq _vision_data_status __vision_data_status)) _vision_data_status)
  (:vision_data_x
   (&optional __vision_data_x)
   (if __vision_data_x (setq _vision_data_x __vision_data_x)) _vision_data_x)
  (:vision_data_y
   (&optional __vision_data_y)
   (if __vision_data_y (setq _vision_data_y __vision_data_y)) _vision_data_y)
  (:vision_data_z
   (&optional __vision_data_z)
   (if __vision_data_z (setq _vision_data_z __vision_data_z)) _vision_data_z)
  (:serialization-length
   ()
   (+
    ;; uint8 _task_id
    1
    ;; uint8 _vision_data_status
    1
    ;; float32 _vision_data_x
    4
    ;; float32 _vision_data_y
    4
    ;; float32 _vision_data_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _task_id
       (write-byte _task_id s)
     ;; uint8 _vision_data_status
       (write-byte _vision_data_status s)
     ;; float32 _vision_data_x
       (sys::poke _vision_data_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vision_data_y
       (sys::poke _vision_data_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vision_data_z
       (sys::poke _vision_data_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _task_id
     (setq _task_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _vision_data_status
     (setq _vision_data_status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _vision_data_x
     (setq _vision_data_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vision_data_y
     (setq _vision_data_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vision_data_z
     (setq _vision_data_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roborts_msgs::feedback_ctrl :md5sum-) "68a1b9aca52b30f74d28848b0013eff7")
(setf (get roborts_msgs::feedback_ctrl :datatype-) "roborts_msgs/feedback_ctrl")
(setf (get roborts_msgs::feedback_ctrl :definition-)
      "uint8   task_id
uint8   vision_data_status
float32 vision_data_x
float32 vision_data_y
float32 vision_data_z

")



(provide :roborts_msgs/feedback_ctrl "68a1b9aca52b30f74d28848b0013eff7")


