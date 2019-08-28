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

class referee_system {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.armor_hurt_id = null;
      this.remain_HP = null;
      this.max_HP = null;
      this.bullet_speed = null;
      this.shooter_remain_heat = null;
      this.shooter_max_heat = null;
    }
    else {
      if (initObj.hasOwnProperty('armor_hurt_id')) {
        this.armor_hurt_id = initObj.armor_hurt_id
      }
      else {
        this.armor_hurt_id = 0;
      }
      if (initObj.hasOwnProperty('remain_HP')) {
        this.remain_HP = initObj.remain_HP
      }
      else {
        this.remain_HP = 0;
      }
      if (initObj.hasOwnProperty('max_HP')) {
        this.max_HP = initObj.max_HP
      }
      else {
        this.max_HP = 0;
      }
      if (initObj.hasOwnProperty('bullet_speed')) {
        this.bullet_speed = initObj.bullet_speed
      }
      else {
        this.bullet_speed = 0.0;
      }
      if (initObj.hasOwnProperty('shooter_remain_heat')) {
        this.shooter_remain_heat = initObj.shooter_remain_heat
      }
      else {
        this.shooter_remain_heat = 0.0;
      }
      if (initObj.hasOwnProperty('shooter_max_heat')) {
        this.shooter_max_heat = initObj.shooter_max_heat
      }
      else {
        this.shooter_max_heat = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type referee_system
    // Serialize message field [armor_hurt_id]
    bufferOffset = _serializer.uint8(obj.armor_hurt_id, buffer, bufferOffset);
    // Serialize message field [remain_HP]
    bufferOffset = _serializer.int16(obj.remain_HP, buffer, bufferOffset);
    // Serialize message field [max_HP]
    bufferOffset = _serializer.int16(obj.max_HP, buffer, bufferOffset);
    // Serialize message field [bullet_speed]
    bufferOffset = _serializer.float32(obj.bullet_speed, buffer, bufferOffset);
    // Serialize message field [shooter_remain_heat]
    bufferOffset = _serializer.float32(obj.shooter_remain_heat, buffer, bufferOffset);
    // Serialize message field [shooter_max_heat]
    bufferOffset = _serializer.float32(obj.shooter_max_heat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type referee_system
    let len;
    let data = new referee_system(null);
    // Deserialize message field [armor_hurt_id]
    data.armor_hurt_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [remain_HP]
    data.remain_HP = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [max_HP]
    data.max_HP = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [bullet_speed]
    data.bullet_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [shooter_remain_heat]
    data.shooter_remain_heat = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [shooter_max_heat]
    data.shooter_max_heat = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roborts_msgs/referee_system';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358d70f927f6ebe96797d1e067a0a634';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8   armor_hurt_id
    int16   remain_HP
    int16   max_HP
    float32 bullet_speed
    float32 shooter_remain_heat
    float32 shooter_max_heat
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new referee_system(null);
    if (msg.armor_hurt_id !== undefined) {
      resolved.armor_hurt_id = msg.armor_hurt_id;
    }
    else {
      resolved.armor_hurt_id = 0
    }

    if (msg.remain_HP !== undefined) {
      resolved.remain_HP = msg.remain_HP;
    }
    else {
      resolved.remain_HP = 0
    }

    if (msg.max_HP !== undefined) {
      resolved.max_HP = msg.max_HP;
    }
    else {
      resolved.max_HP = 0
    }

    if (msg.bullet_speed !== undefined) {
      resolved.bullet_speed = msg.bullet_speed;
    }
    else {
      resolved.bullet_speed = 0.0
    }

    if (msg.shooter_remain_heat !== undefined) {
      resolved.shooter_remain_heat = msg.shooter_remain_heat;
    }
    else {
      resolved.shooter_remain_heat = 0.0
    }

    if (msg.shooter_max_heat !== undefined) {
      resolved.shooter_max_heat = msg.shooter_max_heat;
    }
    else {
      resolved.shooter_max_heat = 0.0
    }

    return resolved;
    }
};

module.exports = referee_system;
