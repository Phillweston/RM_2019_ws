project(detect_factory)

add_library(${PROJECT_NAME}_LIBS
  #armor/RM2017/constraint_set.cpp
  #armor/CC/constraint_set.cpp
  armor/HYY/constraint_set.cpp
  rune/Rune_fiall.cpp
)

target_link_libraries(${PROJECT_NAME}_LIBS
  PUBLIC
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
)