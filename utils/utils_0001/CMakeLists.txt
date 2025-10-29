set(TARGET_NAME utils_0001)
add_executable(${TARGET_NAME} main.cpp)
target_link_libraries(${TARGET_NAME} PRIVATE ${LIB_2_STATIC} ${CONFIGURE_DIRECTORY})
