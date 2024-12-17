# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include".split(';') if "${prefix}/include;/usr/include" != "" else []
PROJECT_CATKIN_DEPENDS = "gazebo_ros;gazebo_plugins;geometry_msgs;nav_msgs;roscpp;rospy".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgazebo_ros_actor_command;-lactor_follower_node;-ldoor_plugin;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0;/usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0".split(';') if "-lgazebo_ros_actor_command;-lactor_follower_node;-ldoor_plugin;/usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0;/usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0" != "" else []
PROJECT_NAME = "dynamic_objects"
PROJECT_SPACE_DIR = "/home/craip/install"
PROJECT_VERSION = "0.0.0"
