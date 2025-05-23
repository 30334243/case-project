set(TARGET_NAME utils_0000)
add_executable(${TARGET_NAME} main.cpp)
target_link_libraries(${TARGET_NAME} PRIVATE ${LIB_STATIC} ${CONFIGURE_DIRECTORY})
target_precompile_headers(${TARGET_NAME} PRIVATE <fstream> <iostream>)