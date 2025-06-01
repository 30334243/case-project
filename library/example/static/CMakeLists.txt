include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")

add_library(${LIB_STATIC} STATIC)
target_link_libraries(${LIB_STATIC} PUBLIC ${LIB_OBJ})
list(APPEND CMAKE_MESSAGE_INDENT "[${LIB_STATIC}] ")
copy_dependencies(${LIB_STATIC} fmt::fmt easy_profiler)