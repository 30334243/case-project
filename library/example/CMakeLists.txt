include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")
#include("${CMAKE_SOURCE_DIR}/cmake/exporting.cmake")

add_library(${LIB_OBJ} OBJECT example.cpp)
target_include_directories(${LIB_OBJ}
        PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_link_libraries(${LIB_OBJ} PUBLIC fmt::fmt ${CONFIGURE_DIRECTORY})
target_link_libraries(${LIB_OBJ} PUBLIC Boost::boost)
set_target_properties(${LIB_OBJ} PROPERTIES POSITION_INDEPENDENT_CODE ON)
target_precompile_headers(
        ${LIB_OBJ}
        PUBLIC
        <cstdint>
        <iostream>
        <fmt/core.h>
)

add_library(${LIB_STATIC} STATIC)
target_link_libraries(${LIB_STATIC} PUBLIC ${LIB_OBJ})
list(APPEND CMAKE_MESSAGE_INDENT "[${LIB_STATIC}] ")
copy_dependencies(${LIB_STATIC} fmt::fmt)

add_library(${LIB_SHARED} SHARED)
target_link_libraries(${LIB_SHARED} PUBLIC ${LIB_OBJ})
list(POP_BACK CMAKE_MESSAGE_INDENT)
list(APPEND CMAKE_MESSAGE_INDENT "[${LIB_SHARED}] ")
copy_dependencies(${LIB_SHARED} fmt::fmt)

#exporting(${PROJECT_NAME})
