// Auto-generated. Do not edit!

// (in-package roborts_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class chassis_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.chassis_mode = null;
      this.chassis_x = null;
      this.chassis_y = null;
      this.chassis_r = null;
    }
    else {
      if (initObj.hasOwnProperty('chassis_mode')) {
        this.chassis_mode = initObj.chassis_mode
      }
      else {
        this.chassis_mode = 0;
      }
      if (initObj.hasOwnProperty('chassis_x')) {
        this.chassis_x = initObj.chassis_x
      }
      else {
        this.chassis_x = 0.0;
      }
      if (initObj.hasOwnProperty('chassis_y')) {
        this.chassis_y = initObj.chassis_y
      }
      else {
        this.chassis_y = 0.0;
      }
      if (initObj.hasOwnProperty('chassis_r')) {
        this.chassis_r = initObj.chassis_r
      }
      else {
        this.chassis_r = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type chassis_info
    // Serialize message field [chassis_mode]
    bufferOffset = _serializer.uint8(obj.chassis_mode, buffer, bufferOffset);
    // Serialize message field [chassis_x]
    bufferOffset = _serializer.float32(obj.chassis_x, buffer, bufferOffset);
    // Serialize message field [chassis_y]
    bufferOffset = _serializer.float32(obj.chassis_y, buffer, bufferOffset);
    // Serialize message field [chassis_r]
    bufferOffset = _serializer.float32(obj.chassis_r, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type chassis_info
    let len;
    let data = new chassis_info(null);
    // Deserialize message field [chassis_mode]
    data.chassis_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [chassis_x]
    data.chassis_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassis_y]
    data.chassis_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [chassis_r]
    data.chassis_r = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/chassis_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1f7db8c7808f9a47fe9116576ce31396';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   chassis_mode
    float32 chassis_x
    float32 chassis_y
    float32 chassis_r
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new chassis_info(null);
    if (msg.chassis_mode !== undefined) {
      resolved.chassis_mode = msg.chassis_mode;
    }
    else {
      resolved.chassis_mode = 0
    }

    if (msg.chassis_x !== undefined) {
      resolved.chassis_x = msg.chassis_x;
    }
    else {
      resolved.chassis_x = 0.0
    }

    if (msg.chassis_y !== undefined) {
      resolved.chassis_y = msg.chassis_y;
    }
    else {
      resolved.chassis_y = 0.0
    }

    if (msg.chassis_r !== undefined) {
      resolved.chassis_r = msg.chassis_r;
    }
    else {
      resolved.chassis_r = 0.0
    }

    return resolved;
    }
};

module.exports = chassis_info;
