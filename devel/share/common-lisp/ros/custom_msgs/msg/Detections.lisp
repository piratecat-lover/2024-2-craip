; Auto-generated. Do not edit!


(cl:in-package custom_msgs-msg)


;//! \htmlinclude Detections.msg.html

(cl:defclass <Detections> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector custom_msgs-msg:Detection)
   :initform (cl:make-array 0 :element-type 'custom_msgs-msg:Detection :initial-element (cl:make-instance 'custom_msgs-msg:Detection))))
)

(cl:defclass Detections (<Detections>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detections>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detections)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msgs-msg:<Detections> is deprecated: use custom_msgs-msg:Detections instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msgs-msg:header-val is deprecated.  Use custom_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <Detections>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msgs-msg:detections-val is deprecated.  Use custom_msgs-msg:detections instead.")
  (detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detections>) ostream)
  "Serializes a message object of type '<Detections>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detections>) istream)
  "Deserializes a message object of type '<Detections>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'custom_msgs-msg:Detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detections>)))
  "Returns string type for a message object of type '<Detections>"
  "custom_msgs/Detections")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detections)))
  "Returns string type for a message object of type 'Detections"
  "custom_msgs/Detections")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detections>)))
  "Returns md5sum for a message object of type '<Detections>"
  "81f9cb6999cd28efac836bbb8d43899e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detections)))
  "Returns md5sum for a message object of type 'Detections"
  "81f9cb6999cd28efac836bbb8d43899e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detections>)))
  "Returns full string definition for message of type '<Detections>"
  (cl:format cl:nil "std_msgs/Header header~%Detection[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: custom_msgs/Detection~%# An individual detection~%string class_name           # e.g. \"soccer_ball\", \"traffic_cone\", \"stop_sign\", \"person\", \"chair\"~%float32 confidence          # detection confidence [0.0 to 1.0]~%int32 x_min                 # bounding box pixel coords~%int32 y_min~%int32 x_max~%int32 y_max~%string detected_color       # e.g. \"red\", \"green\", \"blue\", \"yellow\", \"orange\"~%string shape                # e.g. \"spherical\", \"conical\", \"octagonal\", \"human\", \"chair-like\"~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detections)))
  "Returns full string definition for message of type 'Detections"
  (cl:format cl:nil "std_msgs/Header header~%Detection[] detections~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: custom_msgs/Detection~%# An individual detection~%string class_name           # e.g. \"soccer_ball\", \"traffic_cone\", \"stop_sign\", \"person\", \"chair\"~%float32 confidence          # detection confidence [0.0 to 1.0]~%int32 x_min                 # bounding box pixel coords~%int32 y_min~%int32 x_max~%int32 y_max~%string detected_color       # e.g. \"red\", \"green\", \"blue\", \"yellow\", \"orange\"~%string shape                # e.g. \"spherical\", \"conical\", \"octagonal\", \"human\", \"chair-like\"~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detections>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detections>))
  "Converts a ROS message object to a list"
  (cl:list 'Detections
    (cl:cons ':header (header msg))
    (cl:cons ':detections (detections msg))
))
