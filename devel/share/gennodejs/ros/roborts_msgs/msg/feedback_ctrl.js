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

class feedback_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.task_id = null;
      this.vision_data_status = null;
      this.vision_data_x = null;
      this.vision_data_y = null;
      this.vision_data_z = null;
    }
    else {
      if (initObj.hasOwnProperty('task_id')) {
        this.task_id = initObj.task_id
      }
      else {
        this.task_id = 0;
      }
      if (initObj.hasOwnProperty('vision_data_status')) {
        this.vision_data_status = initObj.vision_data_status
      }
      else {
        this.vision_data_status = 0;
      }
      if (initObj.hasOwnProperty('vision_data_x')) {
        this.vision_data_x = initObj.vision_data_x
      }
      else {
        this.vision_data_x = 0.0;
      }
      if (initObj.hasOwnProperty('vision_data_y')) {
        this.vision_data_y = initObj.vision_data_y
      }
      else {
        this.vision_data_y = 0.0;
      }
      if (initObj.hasOwnProperty('vision_data_z')) {
        this.vision_data_z = initObj.vision_data_z
      }
      else {
        this.vision_data_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type feedback_ctrl
    // Serialize message field [task_id]
    bufferOffset = _serializer.uint8(obj.task_id, buffer, bufferOffset);
    // Serialize message field [vision_data_status]
    bufferOffset = _serializer.uint8(obj.vision_data_status, buffer, bufferOffset);
    // Serialize message field [vision_data_x]
    bufferOffset = _serializer.float32(obj.vision_data_x, buffer, bufferOffset);
    // Serialize message field [vision_data_y]
    bufferOffset = _serializer.float32(obj.vision_data_y, buffer, bufferOffset);
    // Serialize message field [vision_data_z]
    bufferOffset = _serializer.float32(obj.vision_data_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type feedback_ctrl
    let len;
    let data = new feedback_ctrl(null);
    // Deserialize message field [task_id]
    data.task_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vision_data_status]
    data.vision_data_status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [vision_data_x]
    data.vision_data_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vision_data_y]
    data.vision_data_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vision_data_z]
    data.vision_data_z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/feedback_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68a1b9aca52b30f74d28848b0013eff7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   task_id
    uint8   vision_data_status
    float32 vision_data_x
    float32 vision_data_y
    float32 vision_data_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new feedback_ctrl(null);
    if (msg.task_id !== undefined) {
      resolved.task_id = msg.task_id;
    }
    else {
      resolved.task_id = 0
    }

    if (msg.vision_data_status !== undefined) {
      resolved.vision_data_status = msg.vision_data_status;
    }
    else {
      resolved.vision_data_status = 0
    }

    if (msg.vision_data_x !== undefined) {
      resolved.vision_data_x = msg.vision_data_x;
    }
    else {
      resolved.vision_data_x = 0.0
    }

    if (msg.vision_data_y !== undefined) {
      resolved.vision_data_y = msg.vision_data_y;
    }
    else {
      resolved.vision_data_y = 0.0
    }

    if (msg.vision_data_z !== undefined) {
      resolved.vision_data_z = msg.vision_data_z;
    }
    else {
      resolved.vision_data_z = 0.0
    }

    return resolved;
    }
};

module.exports = feedback_ctrl;
