include(user_functions)

add_library(${LIB_2_SHARED} SHARED)
target_link_libraries(${LIB_2_SHARED} PUBLIC ${LIB_2_OBJ})
copy_dependencies(${LIB_2_SHARED} fmt::fmt easy_profiler)