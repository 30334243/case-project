include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")

add_library(${LIB_SHARED} SHARED)
target_link_libraries(${LIB_SHARED} PUBLIC ${LIB_OBJ})
list(POP_BACK CMAKE_MESSAGE_INDENT)
list(APPEND CMAKE_MESSAGE_INDENT "[${LIB_SHARED}] ")
copy_dependencies(${LIB_SHARED} fmt::fmt easy_profiler)