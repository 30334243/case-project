include(user_functions)

add_library(${LIB_SHARED} SHARED)
target_link_libraries(${LIB_SHARED} PUBLIC ${LIB_OBJ})
copy_dependencies(${LIB_SHARED} fmt::fmt easy_profiler)