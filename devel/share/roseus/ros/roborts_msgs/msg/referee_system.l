;; Auto-generated. Do not edit!


(when (boundp 'roborts_msgs::referee_system)
  (if (not (find-package "ROBORTS_MSGS"))
    (make-package "ROBORTS_MSGS"))
  (shadow 'referee_system (find-package "ROBORTS_MSGS")))
(unless (find-package "ROBORTS_MSGS::REFEREE_SYSTEM")
  (make-package "ROBORTS_MSGS::REFEREE_SYSTEM"))

(in-package "ROS")
;;//! \htmlinclude referee_system.msg.html


(defclass roborts_msgs::referee_system
  :super ros::object
  :slots (_armor_hurt_id _remain_HP _max_HP _bullet_speed _shooter_remain_heat _shooter_max_heat ))

(defmethod roborts_msgs::referee_system
  (:init
   (&key
    ((:armor_hurt_id __armor_hurt_id) 0)
    ((:remain_HP __remain_HP) 0)
    ((:max_HP __max_HP) 0)
    ((:bullet_speed __bullet_speed) 0.0)
    ((:shooter_remain_heat __shooter_remain_heat) 0.0)
    ((:shooter_max_heat __shooter_max_heat) 0.0)
    )
   (send-super :init)
   (setq _armor_hurt_id (round __armor_hurt_id))
   (setq _remain_HP (round __remain_HP))
   (setq _max_HP (round __max_HP))
   (setq _bullet_speed (float __bullet_speed))
   (setq _shooter_remain_heat (float __shooter_remain_heat))
   (setq _shooter_max_heat (float __shooter_max_heat))
   self)
  (:armor_hurt_id
   (&optional __armor_hurt_id)
   (if __armor_hurt_id (setq _armor_hurt_id __armor_hurt_id)) _armor_hurt_id)
  (:remain_HP
   (&optional __remain_HP)
   (if __remain_HP (setq _remain_HP __remain_HP)) _remain_HP)
  (:max_HP
   (&optional __max_HP)
   (if __max_HP (setq _max_HP __max_HP)) _max_HP)
  (:bullet_speed
   (&optional __bullet_speed)
   (if __bullet_speed (setq _bullet_speed __bullet_speed)) _bullet_speed)
  (:shooter_remain_heat
   (&optional __shooter_remain_heat)
   (if __shooter_remain_heat (setq _shooter_remain_heat __shooter_remain_heat)) _shooter_remain_heat)
  (:shooter_max_heat
   (&optional __shooter_max_heat)
   (if __shooter_max_heat (setq _shooter_max_heat __shooter_max_heat)) _shooter_max_heat)
  (:serialization-length
   ()
   (+
    ;; uint8 _armor_hurt_id
    1
    ;; int16 _remain_HP
    2
    ;; int16 _max_HP
    2
    ;; float32 _bullet_speed
    4
    ;; float32 _shooter_remain_heat
    4
    ;; float32 _shooter_max_heat
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _armor_hurt_id
       (write-byte _armor_hurt_id s)
     ;; int16 _remain_HP
       (write-word _remain_HP s)
     ;; int16 _max_HP
       (write-word _max_HP s)
     ;; float32 _bullet_speed
       (sys::poke _bullet_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _shooter_remain_heat
       (sys::poke _shooter_remain_heat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _shooter_max_heat
       (sys::poke _shooter_max_heat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _armor_hurt_id
     (setq _armor_hurt_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _remain_HP
     (setq _remain_HP (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _max_HP
     (setq _max_HP (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _bullet_speed
     (setq _bullet_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _shooter_remain_heat
     (setq _shooter_remain_heat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _shooter_max_heat
     (setq _shooter_max_heat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get roborts_msgs::referee_system :md5sum-) "358d70f927f6ebe96797d1e067a0a634")
(setf (get roborts_msgs::referee_system :datatype-) "roborts_msgs/referee_system")
(setf (get roborts_msgs::referee_system :definition-)
      "uint8   armor_hurt_id
int16   remain_HP
int16   max_HP
float32 bullet_speed
float32 shooter_remain_heat
float32 shooter_max_heat
")



(provide :roborts_msgs/referee_system "358d70f927f6ebe96797d1e067a0a634")


