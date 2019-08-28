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

class feedback_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd_mode')) {
        this.cmd_mode = initObj.cmd_mode
      }
      else {
        this.cmd_mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type feedback_info
    // Serialize message field [cmd_mode]
    bufferOffset = _serializer.uint8(obj.cmd_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type feedback_info
    let len;
    let data = new feedback_info(null);
    // Deserialize message field [cmd_mode]
    data.cmd_mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/feedback_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '418ed2d86b8db9916390cc3f18d9d630';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   cmd_mode
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new feedback_info(null);
    if (msg.cmd_mode !== undefined) {
      resolved.cmd_mode = msg.cmd_mode;
    }
    else {
      resolved.cmd_mode = 0
    }

    return resolved;
    }
};

module.exports = feedback_info;
