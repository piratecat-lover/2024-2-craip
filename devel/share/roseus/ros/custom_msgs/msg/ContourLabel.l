;; Auto-generated. Do not edit!


(when (boundp 'custom_msgs::ContourLabel)
  (if (not (find-package "CUSTOM_MSGS"))
    (make-package "CUSTOM_MSGS"))
  (shadow 'ContourLabel (find-package "CUSTOM_MSGS")))
(unless (find-package "CUSTOM_MSGS::CONTOURLABEL")
  (make-package "CUSTOM_MSGS::CONTOURLABEL"))

(in-package "ROS")
;;//! \htmlinclude ContourLabel.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass custom_msgs::ContourLabel
  :super ros::object
  :slots (_centroids _labels ))

(defmethod custom_msgs::ContourLabel
  (:init
   (&key
    ((:centroids __centroids) ())
    ((:labels __labels) ())
    )
   (send-super :init)
   (setq _centroids __centroids)
   (setq _labels __labels)
   self)
  (:centroids
   (&rest __centroids)
   (if (keywordp (car __centroids))
       (send* _centroids __centroids)
     (progn
       (if __centroids (setq _centroids (car __centroids)))
       _centroids)))
  (:labels
   (&rest __labels)
   (if (keywordp (car __labels))
       (send* _labels __labels)
     (progn
       (if __labels (setq _labels (car __labels)))
       _labels)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _centroids
    (apply #'+ (send-all _centroids :serialization-length)) 4
    ;; std_msgs/String[] _labels
    (apply #'+ (send-all _labels :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _centroids
     (write-long (length _centroids) s)
     (dolist (elem _centroids)
       (send elem :serialize s)
       )
     ;; std_msgs/String[] _labels
     (write-long (length _labels) s)
     (dolist (elem _labels)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _centroids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _centroids (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _centroids)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; std_msgs/String[] _labels
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _labels (let (r) (dotimes (i n) (push (instance std_msgs::String :init) r)) r))
     (dolist (elem- _labels)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get custom_msgs::ContourLabel :md5sum-) "5c15b036d0822a1bdfe9a97fda089070")
(setf (get custom_msgs::ContourLabel :datatype-) "custom_msgs/ContourLabel")
(setf (get custom_msgs::ContourLabel :definition-)
      "geometry_msgs/Point[] centroids
std_msgs/String[] labels
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/String
string data

")



(provide :custom_msgs/ContourLabel "5c15b036d0822a1bdfe9a97fda089070")


