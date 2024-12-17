// Auto-generated. Do not edit!

// (in-package custom_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ContourLabel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.centroids = null;
      this.labels = null;
    }
    else {
      if (initObj.hasOwnProperty('centroids')) {
        this.centroids = initObj.centroids
      }
      else {
        this.centroids = [];
      }
      if (initObj.hasOwnProperty('labels')) {
        this.labels = initObj.labels
      }
      else {
        this.labels = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ContourLabel
    // Serialize message field [centroids]
    // Serialize the length for message field [centroids]
    bufferOffset = _serializer.uint32(obj.centroids.length, buffer, bufferOffset);
    obj.centroids.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [labels]
    // Serialize the length for message field [labels]
    bufferOffset = _serializer.uint32(obj.labels.length, buffer, bufferOffset);
    obj.labels.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ContourLabel
    let len;
    let data = new ContourLabel(null);
    // Deserialize message field [centroids]
    // Deserialize array length for message field [centroids]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.centroids = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.centroids[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [labels]
    // Deserialize array length for message field [labels]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.labels = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.labels[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.centroids.length;
    object.labels.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'custom_msgs/ContourLabel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5c15b036d0822a1bdfe9a97fda089070';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] centroids
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ContourLabel(null);
    if (msg.centroids !== undefined) {
      resolved.centroids = new Array(msg.centroids.length);
      for (let i = 0; i < resolved.centroids.length; ++i) {
        resolved.centroids[i] = geometry_msgs.msg.Point.Resolve(msg.centroids[i]);
      }
    }
    else {
      resolved.centroids = []
    }

    if (msg.labels !== undefined) {
      resolved.labels = new Array(msg.labels.length);
      for (let i = 0; i < resolved.labels.length; ++i) {
        resolved.labels[i] = std_msgs.msg.String.Resolve(msg.labels[i]);
      }
    }
    else {
      resolved.labels = []
    }

    return resolved;
    }
};

module.exports = ContourLabel;
