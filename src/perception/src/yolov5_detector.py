#!/usr/bin/env python
import rospy
import torch
import cv2
import numpy as np
from sensor_msgs.msg import Image
from std_msgs.msg import Bool, String
from cv_bridge import CvBridge, CvBridgeError
from custom_msgs.msg import Detections, Detection
from vlmaps.utils.mp3dcat import mp3dcat

class YOLOv5DetectorNode:
    def __init__(self):
        rospy.init_node('yolov5_detector', anonymous=True)

        # Load YOLO model from pretrained weights
        self.model = torch.hub.load('ultralytics/yolov5', 'custom', path='/home/craip/src/yolo_v5/best_robot_v3.pt')
        self.model.conf = 0.5
        self.model.iou = 0.45
        self.class_names = self.model.names
        self.bridge = CvBridge()
        self.collision_detected = False

        # Collision detection subscription
        collision_detection_topic = rospy.get_param("~collision_detection_topic", "/is_collision")
        self.collision_sub = rospy.Subscriber(collision_detection_topic, Bool, self.collision_callback, queue_size=1)

        # Camera subscription
        self.image_sub = rospy.Subscriber("/camera_face/color/image_raw", Image, self.image_callback, queue_size=1)

        # Publishers
        self.detections_pub = rospy.Publisher("/yolov5/detections", Detections, queue_size=10)
        # New publisher for detected landmarks
        self.landmark_pub = rospy.Publisher("/detected_landmark", String, queue_size=10)
        
        self.known_landmarks = mp3dcat

        rospy.loginfo("YOLOv5 Detector Node started, integrated with collision and SCF.")

    def collision_callback(self, msg):
        self.collision_detected = msg.data
        if self.collision_detected:
            rospy.logwarn("Collision detected! YOLO node aware of collision.")
        else:
            rospy.loginfo("No collision detected.")

    # Callback for detected targets
    def image_callback(self, img_msg):
        try:
            cv_img = self.bridge.imgmsg_to_cv2(img_msg, "bgr8")
        except CvBridgeError as e:
            rospy.logerr("CV Bridge error: %s" % e)
            return

        # Run YOLO inference
        results = self.model(cv_img)
        detections_np = results.xyxy[0].cpu().numpy()

        detections_msg = Detections()
        detections_msg.header = img_msg.header

        # # Classes you care about:
        # interested_classes = ["1", "2", "3", "4", "ac", "ball", "blue", "can", "chair", "door", "foldable_chair", "goal_post", "green", "human",  "mission_chair",  "red", "sign_circle", "sign_square", "sign_stop", "sign_triangle", "sofa"]
        
        # Track found landmarks
        found_landmarks = set()

        for det in detections_np:
            det_id, x_min, y_min, x_max, y_max, cls_id, conf = det
            if int(cls_id) in self.class_names:
                class_name = self.class_names[int(cls_id)]
            else:
                class_name = "unknown"
            
            # Check if this class_name is a known landmark
            if class_name in self.known_landmarks:
                found_landmarks.add(class_name)
            
            det_msg = Detection()
            det_msg.det_id = int(det_id)
            det_msg.class_name = class_name
            det_msg.confidence = float(conf)
            det_msg.x_min = int(x_min)
            det_msg.y_min = int(y_min)
            det_msg.x_max = int(x_max)
            det_msg.y_max = int(y_max)
            detections_msg.detections.append(det_msg)

        self.detections_pub.publish(detections_msg)
        
        # If we found landmarks, publish them so VLMaps planner can update goals
        for landmark in found_landmarks:
            landmark_msg = String()
            landmark_msg.data = landmark
            self.landmark_pub.publish(landmark_msg)
            rospy.loginfo(f"Published detected landmark: {landmark}")


if __name__ == "__main__":
    node = YOLOv5DetectorNode()
    rospy.spin()