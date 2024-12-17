;; Auto-generated. Do not edit!


(when (boundp 'custom_msgs::Detections)
  (if (not (find-package "CUSTOM_MSGS"))
    (make-package "CUSTOM_MSGS"))
  (shadow 'Detections (find-package "CUSTOM_MSGS")))
(unless (find-package "CUSTOM_MSGS::DETECTIONS")
  (make-package "CUSTOM_MSGS::DETECTIONS"))

(in-package "ROS")
;;//! \htmlinclude Detections.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass custom_msgs::Detections
  :super ros::object
  :slots (_header _detections ))

(defmethod custom_msgs::Detections
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detections __detections) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _detections __detections)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detections
   (&rest __detections)
   (if (keywordp (car __detections))
       (send* _detections __detections)
     (progn
       (if __detections (setq _detections (car __detections)))
       _detections)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; custom_msgs/Detection[] _detections
    (apply #'+ (send-all _detections :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; custom_msgs/Detection[] _detections
     (write-long (length _detections) s)
     (dolist (elem _detections)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; custom_msgs/Detection[] _detections
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _detections (let (r) (dotimes (i n) (push (instance custom_msgs::Detection :init) r)) r))
     (dolist (elem- _detections)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get custom_msgs::Detections :md5sum-) "81f9cb6999cd28efac836bbb8d43899e")
(setf (get custom_msgs::Detections :datatype-) "custom_msgs/Detections")
(setf (get custom_msgs::Detections :definition-)
      "std_msgs/Header header
Detection[] detections
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: custom_msgs/Detection
# An individual detection
string class_name           # e.g. \"soccer_ball\", \"traffic_cone\", \"stop_sign\", \"person\", \"chair\"
float32 confidence          # detection confidence [0.0 to 1.0]
int32 x_min                 # bounding box pixel coords
int32 y_min
int32 x_max
int32 y_max
string detected_color       # e.g. \"red\", \"green\", \"blue\", \"yellow\", \"orange\"
string shape                # e.g. \"spherical\", \"conical\", \"octagonal\", \"human\", \"chair-like\"
")



(provide :custom_msgs/Detections "81f9cb6999cd28efac836bbb8d43899e")


