
"use strict";

let chassis_info = require('./chassis_info.js');
let chassis_ctrl = require('./chassis_ctrl.js');
let feedback_info = require('./feedback_info.js');
let feedback_ctrl = require('./feedback_ctrl.js');
let gimbal_ctrl = require('./gimbal_ctrl.js');
let gimbal_info = require('./gimbal_info.js');
let referee_system = require('./referee_system.js');

module.exports = {
  chassis_info: chassis_info,
  chassis_ctrl: chassis_ctrl,
  feedback_info: feedback_info,
  feedback_ctrl: feedback_ctrl,
  gimbal_ctrl: gimbal_ctrl,
  gimbal_info: gimbal_info,
  referee_system: referee_system,
};
