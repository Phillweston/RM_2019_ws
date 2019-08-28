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

class gimbal_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gimbal_mode = null;
      this.gimbal_yaw = null;
      this.gimbal_pitch = null;
    }
    else {
      if (initObj.hasOwnProperty('gimbal_mode')) {
        this.gimbal_mode = initObj.gimbal_mode
      }
      else {
        this.gimbal_mode = 0;
      }
      if (initObj.hasOwnProperty('gimbal_yaw')) {
        this.gimbal_yaw = initObj.gimbal_yaw
      }
      else {
        this.gimbal_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('gimbal_pitch')) {
        this.gimbal_pitch = initObj.gimbal_pitch
      }
      else {
        this.gimbal_pitch = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbal_info
    // Serialize message field [gimbal_mode]
    bufferOffset = _serializer.uint8(obj.gimbal_mode, buffer, bufferOffset);
    // Serialize message field [gimbal_yaw]
    bufferOffset = _serializer.float32(obj.gimbal_yaw, buffer, bufferOffset);
    // Serialize message field [gimbal_pitch]
    bufferOffset = _serializer.float32(obj.gimbal_pitch, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbal_info
    let len;
    let data = new gimbal_info(null);
    // Deserialize message field [gimbal_mode]
    data.gimbal_mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gimbal_yaw]
    data.gimbal_yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gimbal_pitch]
    data.gimbal_pitch = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/gimbal_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ff1dad119a0d9688115465f7f16fbe0b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   gimbal_mode
    float32 gimbal_yaw
    float32 gimbal_pitch
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbal_info(null);
    if (msg.gimbal_mode !== undefined) {
      resolved.gimbal_mode = msg.gimbal_mode;
    }
    else {
      resolved.gimbal_mode = 0
    }

    if (msg.gimbal_yaw !== undefined) {
      resolved.gimbal_yaw = msg.gimbal_yaw;
    }
    else {
      resolved.gimbal_yaw = 0.0
    }

    if (msg.gimbal_pitch !== undefined) {
      resolved.gimbal_pitch = msg.gimbal_pitch;
    }
    else {
      resolved.gimbal_pitch = 0.0
    }

    return resolved;
    }
};

module.exports = gimbal_info;
