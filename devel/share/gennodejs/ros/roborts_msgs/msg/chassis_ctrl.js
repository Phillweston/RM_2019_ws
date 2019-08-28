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

class chassis_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_chassis_mode = null;
      this.cmd_chassis_x = null;
      this.cmd_chassis_y = null;
      this.cmd_chassis_r = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_chassis_mode')) {
        this.cmd_chassis_mode = initObj.cmd_chassis_mode
      }
      else {
        this.cmd_chassis_mode = 0;
      }
      if (initObj.hasOwnProperty('cmd_chassis_x')) {
        this.cmd_chassis_x = initObj.cmd_chassis_x
      }
      else {
        this.cmd_chassis_x = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_chassis_y')) {
        this.cmd_chassis_y = initObj.cmd_chassis_y
      }
      else {
        this.cmd_chassis_y = 0.0;
      }
      if (initObj.hasOwnProperty('cmd_chassis_r')) {
        this.cmd_chassis_r = initObj.cmd_chassis_r
      }
      else {
        this.cmd_chassis_r = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type chassis_ctrl
    // Serialize message field [cmd_chassis_mode]
    bufferOffset = _serializer.uint8(obj.cmd_chassis_mode, buffer, bufferOffset);
    // Serialize message field [cmd_chassis_x]
    bufferOffset = _serializer.float32(obj.cmd_chassis_x, buffer, bufferOffset);
    // Serialize message field [cmd_chassis_y]
    bufferOffset = _serializer.float32(obj.cmd_chassis_y, buffer, bufferOffset);
    // Serialize message field [cmd_chassis_r]
    bufferOffset = _serializer.float32(obj.cmd_chassis_r, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type chassis_ctrl
    let len;
    let data = new chassis_ctrl(null);
    // Deserialize message field [cmd_chassis_mode]
    data.cmd_chassis_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cmd_chassis_x]
    data.cmd_chassis_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_chassis_y]
    data.cmd_chassis_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cmd_chassis_r]
    data.cmd_chassis_r = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/chassis_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd718a58c641ad306069461333848a771';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   cmd_chassis_mode
    float32 cmd_chassis_x
    float32 cmd_chassis_y
    float32 cmd_chassis_r
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new chassis_ctrl(null);
    if (msg.cmd_chassis_mode !== undefined) {
      resolved.cmd_chassis_mode = msg.cmd_chassis_mode;
    }
    else {
      resolved.cmd_chassis_mode = 0
    }

    if (msg.cmd_chassis_x !== undefined) {
      resolved.cmd_chassis_x = msg.cmd_chassis_x;
    }
    else {
      resolved.cmd_chassis_x = 0.0
    }

    if (msg.cmd_chassis_y !== undefined) {
      resolved.cmd_chassis_y = msg.cmd_chassis_y;
    }
    else {
      resolved.cmd_chassis_y = 0.0
    }

    if (msg.cmd_chassis_r !== undefined) {
      resolved.cmd_chassis_r = msg.cmd_chassis_r;
    }
    else {
      resolved.cmd_chassis_r = 0.0
    }

    return resolved;
    }
};

module.exports = chassis_ctrl;
