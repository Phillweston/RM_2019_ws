# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "roborts_msgs: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iroborts_msgs:/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis;-Iroborts_msgs:/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback;-Iroborts_msgs:/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal;-Iroborts_msgs:/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(roborts_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" ""
)

get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_custom_target(_roborts_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "roborts_msgs" "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_cpp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(roborts_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(roborts_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(roborts_msgs_generate_messages roborts_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_cpp _roborts_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roborts_msgs_gencpp)
add_dependencies(roborts_msgs_gencpp roborts_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roborts_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)
_generate_msg_eus(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(roborts_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(roborts_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(roborts_msgs_generate_messages roborts_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_eus _roborts_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roborts_msgs_geneus)
add_dependencies(roborts_msgs_geneus roborts_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roborts_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)
_generate_msg_lisp(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(roborts_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(roborts_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(roborts_msgs_generate_messages roborts_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_lisp _roborts_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roborts_msgs_genlisp)
add_dependencies(roborts_msgs_genlisp roborts_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roborts_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)
_generate_msg_nodejs(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(roborts_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(roborts_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(roborts_msgs_generate_messages roborts_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_nodejs _roborts_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roborts_msgs_gennodejs)
add_dependencies(roborts_msgs_gennodejs roborts_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roborts_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)
_generate_msg_py(roborts_msgs
  "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(roborts_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(roborts_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(roborts_msgs_generate_messages roborts_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/referee_system/referee_system.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/gimbal/gimbal_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/feedback/feedback_ctrl.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/dji/hyy_ws/src/8.6 No.4/roborts_msgs/chassis/chassis_info.msg" NAME_WE)
add_dependencies(roborts_msgs_generate_messages_py _roborts_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(roborts_msgs_genpy)
add_dependencies(roborts_msgs_genpy roborts_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS roborts_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/roborts_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(roborts_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(roborts_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(roborts_msgs_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/roborts_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(roborts_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(roborts_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(roborts_msgs_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/roborts_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(roborts_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(roborts_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(roborts_msgs_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/roborts_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(roborts_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(roborts_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(roborts_msgs_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/roborts_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(roborts_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(roborts_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(roborts_msgs_generate_messages_py nav_msgs_generate_messages_py)
endif()
