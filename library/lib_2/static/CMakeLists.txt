include(user_functions)

add_library(${LIB_2_STATIC} STATIC)
target_link_libraries(${LIB_2_STATIC} PUBLIC ${LIB_2_OBJ})
copy_dependencies(${LIB_2_STATIC} fmt::fmt easy_profiler)