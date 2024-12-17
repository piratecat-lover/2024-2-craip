cmake_minimum_required(VERSION 3.0.2)
project(perception)

find_package(catkin REQUIRED COMPONENTS
    rospy    
    roscpp
    std_msgs
    sensor_msgs
    gazebo_msgs
    pcl_ros
    cv_bridge
    message_generation
    custom_msgs
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp std_msgs custom_msgs message_runtime
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(collision_detection
 src/collision_detection.cpp
)
target_link_libraries(collision_detection
  ${catkin_LIBRARIES}
)

add_executable(collision_detection_gazebo
 src/collision_detection_gazebo.cpp
)
target_link_libraries(collision_detection_gazebo
  ${catkin_LIBRARIES}
)

add_executable(yolo_consumer
 src/yolo_consumer.cpp
)

add_dependencies(yolo_consumer
 ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS}
)

target_link_libraries(yolo_consumer
 ${catkin_LIBRARIES}
)

install(TARGETS yolo_consumer
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

catkin_install_python(PROGRAMS scripts/yolov5_detector.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)