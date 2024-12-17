;; Auto-generated. Do not edit!


(when (boundp 'custom_msgs::Detection)
  (if (not (find-package "CUSTOM_MSGS"))
    (make-package "CUSTOM_MSGS"))
  (shadow 'Detection (find-package "CUSTOM_MSGS")))
(unless (find-package "CUSTOM_MSGS::DETECTION")
  (make-package "CUSTOM_MSGS::DETECTION"))

(in-package "ROS")
;;//! \htmlinclude Detection.msg.html


(defclass custom_msgs::Detection
  :super ros::object
  :slots (_class_name _confidence _x_min _y_min _x_max _y_max _detected_color _shape ))

(defmethod custom_msgs::Detection
  (:init
   (&key
    ((:class_name __class_name) "")
    ((:confidence __confidence) 0.0)
    ((:x_min __x_min) 0)
    ((:y_min __y_min) 0)
    ((:x_max __x_max) 0)
    ((:y_max __y_max) 0)
    ((:detected_color __detected_color) "")
    ((:shape __shape) "")
    )
   (send-super :init)
   (setq _class_name (string __class_name))
   (setq _confidence (float __confidence))
   (setq _x_min (round __x_min))
   (setq _y_min (round __y_min))
   (setq _x_max (round __x_max))
   (setq _y_max (round __y_max))
   (setq _detected_color (string __detected_color))
   (setq _shape (string __shape))
   self)
  (:class_name
   (&optional __class_name)
   (if __class_name (setq _class_name __class_name)) _class_name)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:x_min
   (&optional __x_min)
   (if __x_min (setq _x_min __x_min)) _x_min)
  (:y_min
   (&optional __y_min)
   (if __y_min (setq _y_min __y_min)) _y_min)
  (:x_max
   (&optional __x_max)
   (if __x_max (setq _x_max __x_max)) _x_max)
  (:y_max
   (&optional __y_max)
   (if __y_max (setq _y_max __y_max)) _y_max)
  (:detected_color
   (&optional __detected_color)
   (if __detected_color (setq _detected_color __detected_color)) _detected_color)
  (:shape
   (&optional __shape)
   (if __shape (setq _shape __shape)) _shape)
  (:serialization-length
   ()
   (+
    ;; string _class_name
    4 (length _class_name)
    ;; float32 _confidence
    4
    ;; int32 _x_min
    4
    ;; int32 _y_min
    4
    ;; int32 _x_max
    4
    ;; int32 _y_max
    4
    ;; string _detected_color
    4 (length _detected_color)
    ;; string _shape
    4 (length _shape)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _class_name
       (write-long (length _class_name) s) (princ _class_name s)
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _x_min
       (write-long _x_min s)
     ;; int32 _y_min
       (write-long _y_min s)
     ;; int32 _x_max
       (write-long _x_max s)
     ;; int32 _y_max
       (write-long _y_max s)
     ;; string _detected_color
       (write-long (length _detected_color) s) (princ _detected_color s)
     ;; string _shape
       (write-long (length _shape) s) (princ _shape s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _class_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _x_min
     (setq _x_min (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y_min
     (setq _y_min (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x_max
     (setq _x_max (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y_max
     (setq _y_max (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _detected_color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detected_color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get custom_msgs::Detection :md5sum-) "7fe439705ef9b9df34d56b132c400dc9")
(setf (get custom_msgs::Detection :datatype-) "custom_msgs/Detection")
(setf (get custom_msgs::Detection :definition-)
      "# An individual detection
string class_name           # e.g. \"soccer_ball\", \"traffic_cone\", \"stop_sign\", \"person\", \"chair\"
float32 confidence          # detection confidence [0.0 to 1.0]
int32 x_min                 # bounding box pixel coords
int32 y_min
int32 x_max
int32 y_max
string detected_color       # e.g. \"red\", \"green\", \"blue\", \"yellow\", \"orange\"
string shape                # e.g. \"spherical\", \"conical\", \"octagonal\", \"human\", \"chair-like\"
")



(provide :custom_msgs/Detection "7fe439705ef9b9df34d56b132c400dc9")


