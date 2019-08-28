;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::feedback_info)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'feedback_info (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::FEEDBACK_INFO")
  (make-package "ROBORTS_MSGS::FEEDBACK_INFO"))

(in-package "ROS")
;;//! \htmlinclude feedback_info.msg.html


(defclass roborts_msgs::feedback_info
  :super ros::object
  :slots (_cmd_mode ))

(defmethod roborts_msgs::feedback_info
  (:init
   (&key
    ((:cmd_mode __cmd_mode) 0)
    )
   (send-super :init)
   (setq _cmd_mode (round __cmd_mode))
   self)
  (:cmd_mode
   (&optional __cmd_mode)
   (if __cmd_mode (setq _cmd_mode __cmd_mode)) _cmd_mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _cmd_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _cmd_mode
       (write-byte _cmd_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _cmd_mode
     (setq _cmd_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get roborts_msgs::feedback_info :md5sum-) "418ed2d86b8db9916390cc3f18d9d630")
(setf (get roborts_msgs::feedback_info :datatype-) "roborts_msgs/feedback_info")
(setf (get roborts_msgs::feedback_info :definition-)
      "uint8   cmd_mode
")



(provide :roborts_msgs/feedback_info "418ed2d86b8db9916390cc3f18d9d630")


