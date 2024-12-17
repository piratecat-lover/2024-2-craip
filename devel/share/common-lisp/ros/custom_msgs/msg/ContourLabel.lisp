; Auto-generated. Do not edit!


(cl:in-package custom_msgs-msg)


;//! \htmlinclude ContourLabel.msg.html

(cl:defclass <ContourLabel> (roslisp-msg-protocol:ros-message)
  ((centroids
    :reader centroids
    :initarg :centroids
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (labels
    :reader labels
    :initarg :labels
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String))))
)

(cl:defclass ContourLabel (<ContourLabel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContourLabel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContourLabel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msgs-msg:<ContourLabel> is deprecated: use custom_msgs-msg:ContourLabel instead.")))

(cl:ensure-generic-function 'centroids-val :lambda-list '(m))
(cl:defmethod centroids-val ((m <ContourLabel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msgs-msg:centroids-val is deprecated.  Use custom_msgs-msg:centroids instead.")
  (centroids m))

(cl:ensure-generic-function 'labels-val :lambda-list '(m))
(cl:defmethod labels-val ((m <ContourLabel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msgs-msg:labels-val is deprecated.  Use custom_msgs-msg:labels instead.")
  (labels m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContourLabel>) ostream)
  "Serializes a message object of type '<ContourLabel>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'centroids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'centroids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'labels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'labels))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContourLabel>) istream)
  "Deserializes a message object of type '<ContourLabel>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'centroids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'centroids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'labels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'labels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContourLabel>)))
  "Returns string type for a message object of type '<ContourLabel>"
  "custom_msgs/ContourLabel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContourLabel)))
  "Returns string type for a message object of type 'ContourLabel"
  "custom_msgs/ContourLabel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContourLabel>)))
  "Returns md5sum for a message object of type '<ContourLabel>"
  "5c15b036d0822a1bdfe9a97fda089070")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContourLabel)))
  "Returns md5sum for a message object of type 'ContourLabel"
  "5c15b036d0822a1bdfe9a97fda089070")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContourLabel>)))
  "Returns full string definition for message of type '<ContourLabel>"
  (cl:format cl:nil "geometry_msgs/Point[] centroids~%std_msgs/String[] labels~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContourLabel)))
  "Returns full string definition for message of type 'ContourLabel"
  (cl:format cl:nil "geometry_msgs/Point[] centroids~%std_msgs/String[] labels~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContourLabel>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'centroids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'labels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContourLabel>))
  "Converts a ROS message object to a list"
  (cl:list 'ContourLabel
    (cl:cons ':centroids (centroids msg))
    (cl:cons ':labels (labels msg))
))
