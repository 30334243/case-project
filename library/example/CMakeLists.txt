include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")

set(LIB_OBJ lib_obj)
add_library(${LIB_OBJ} OBJECT example.cpp)
target_include_directories(${LIB_OBJ}
        PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_link_libraries(${LIB_OBJ} PUBLIC fmt::fmt easy_profiler ${CONFIGURE_DIRECTORY})
target_link_libraries(${LIB_OBJ} PUBLIC Boost::boost)
set_target_properties(${LIB_OBJ} PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_precompile_headers(
        ${LIB_OBJ}
        PUBLIC
        <cstdint>
        <iostream>
        <fmt/core.h>
        <easy/profiler.h>
)

add_subdirectory(shared)
add_subdirectory(static)
