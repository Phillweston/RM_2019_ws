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

class gimbal_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_gimbal_mode = null;
      this.cmd_gimbal_yaw = null;
      this.cmd_gimbal_pitch = null;
      this.cmd_gimbal_fric_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_gimbal_mode')) {
        this.cmd_gimbal_mode = initObj.cmd_gimbal_mode
      }
      else {
        this.cmd_gimbal_mode = 0;
      }
      if (initObj.hasOwnProperty('cmd_gimbal_yaw')) {
        this.cmd_gimbal_yaw = initObj.cmd_gimbal_yaw
      }
      else {
        this.cmd_gimbal_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_gimbal_pitch')) {
        this.cmd_gimbal_pitch = initObj.cmd_gimbal_pitch
      }
      else {
        this.cmd_gimbal_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_gimbal_fric_speed')) {
        this.cmd_gimbal_fric_speed = initObj.cmd_gimbal_fric_speed
      }
      else {
        this.cmd_gimbal_fric_speed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbal_ctrl
    // Serialize message field [cmd_gimbal_mode]
    bufferOffset = _serializer.uint8(obj.cmd_gimbal_mode, buffer, bufferOffset);
    // Serialize message field [cmd_gimbal_yaw]
    bufferOffset = _serializer.float32(obj.cmd_gimbal_yaw, buffer, bufferOffset);
    // Serialize message field [cmd_gimbal_pitch]
    bufferOffset = _serializer.float32(obj.cmd_gimbal_pitch, buffer, bufferOffset);
    // Serialize message field [cmd_gimbal_fric_speed]
    bufferOffset = _serializer.uint8(obj.cmd_gimbal_fric_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbal_ctrl
    let len;
    let data = new gimbal_ctrl(null);
    // Deserialize message field [cmd_gimbal_mode]
    data.cmd_gimbal_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_gimbal_yaw]
    data.cmd_gimbal_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_gimbal_pitch]
    data.cmd_gimbal_pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_gimbal_fric_speed]
    data.cmd_gimbal_fric_speed = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/gimbal_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '31acb477b7f21d2e6fa8ecbdc101a6b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   cmd_gimbal_mode
    float32 cmd_gimbal_yaw
    float32 cmd_gimbal_pitch
    uint8   cmd_gimbal_fric_speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbal_ctrl(null);
    if (msg.cmd_gimbal_mode !== undefined) {
      resolved.cmd_gimbal_mode = msg.cmd_gimbal_mode;
    }
    else {
      resolved.cmd_gimbal_mode = 0
    }

    if (msg.cmd_gimbal_yaw !== undefined) {
      resolved.cmd_gimbal_yaw = msg.cmd_gimbal_yaw;
    }
    else {
      resolved.cmd_gimbal_yaw = 0.0
    }

    if (msg.cmd_gimbal_pitch !== undefined) {
      resolved.cmd_gimbal_pitch = msg.cmd_gimbal_pitch;
    }
    else {
      resolved.cmd_gimbal_pitch = 0.0
    }

    if (msg.cmd_gimbal_fric_speed !== undefined) {
      resolved.cmd_gimbal_fric_speed = msg.cmd_gimbal_fric_speed;
    }
    else {
      resolved.cmd_gimbal_fric_speed = 0
    }

    return resolved;
    }
};

module.exports = gimbal_ctrl;
