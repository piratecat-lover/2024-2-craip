#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Image
from custom_msgs.msg import Detection, Detections
from cv_bridge import CvBridge
import cv2
import torch

class YoloInferenceNode:
    def __init__(self):
        rospy.init_node('yolo_inference_node')
        self.bridge = CvBridge()
        self.model = torch.hub.load('ultralytics/yolov5', 'custom', path='./yolo_params.pt')
        self.pub = rospy.Publisher('/detected_objects', DetectionArray, queue_size=1)
        # Subscribe to the camera topic - remember path!
        rospy.Subscriber('/camera_face/rgb/image_raw', Image, self.callback, queue_size=1)
    
    def callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        results = self.model(cv_image)  # Run inference
        detections = results.xyxy[0]    # bounding boxes: [x_min, y_min, x_max, y_max, confidence, class]
        class_names = self.model.names

        det_array = Detections()
        det_array.header = msg.header
        for det in detections:
            cls_id, conf, x_min, y_min, x_max, y_max = det
            d = Detection()
            d.class_name = class_names[int(cls_id)]
            d.confidence = float(conf)
            d.x_min = float(x_min)
            d.y_min = float(y_min)
            d.x_max = float(x_max)
            d.y_max = float(y_max)
            det_array.detections.append(d)

        self.pub.publish(det_array)

if __name__ == '__main__':
    node = YoloInferenceNode()
    rospy.spin()