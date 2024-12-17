#include <ros/ros.h>
#include <std_msgs/String.h>
#include <custom_msgs/Detection.h>
#include <custom_msgs/Detections.h>

void landmarkCallback(const std_msgs::String::ConstPtr& msg) {
    ROS_INFO("Received landmark: %s", msg->data.c_str());
    // The VLMaps planning node (scf_wrapper.py) receives this landmark as well and plans a goal.
    // If desired, you could add extra logic here or trigger other actions.
}

void detectionsCallback(const custom_msgs::Detections::ConstPtr& msg) {
    // Process YOLO detections
    for (auto &det : msg->detections) {
        ROS_INFO("Detected %s with confidence %f at (%d,%d,%d,%d)",
                 det.class_name.c_str(), det.confidence,
                 det.x_min, det.y_min, det.x_max, det.y_max);
    }
    // The SCF and VLMaps planner logic is triggered by the '/detected_landmark' topic, no direct action needed here.

    // Hardcode actions based on detected object: can, human, cone, sign_stop, signs, mission_chair.
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "yolo_consumer");
    ros::NodeHandle nh;

    ros::Subscriber landmark_sub = nh.subscribe("/detected_landmark", 10, landmarkCallback);
    ros::Subscriber detections_sub = nh.subscribe("/yolov5/detections", 10, detectionsCallback);

    ros::spin();
    return 0;
}