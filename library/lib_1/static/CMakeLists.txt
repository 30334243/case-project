include(user_functions)

add_library(${LIB_STATIC} STATIC)
target_link_libraries(${LIB_STATIC} PUBLIC ${LIB_OBJ})
copy_dependencies(${LIB_STATIC} fmt::fmt easy_profiler)