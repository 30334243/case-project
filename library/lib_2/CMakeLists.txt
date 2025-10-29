include(user_functions)

add_user_lib(NAME ${LIB_2_OBJ} SOURCES lib_2.cpp
        LIBRARIES
        Boost::boost
        fmt::fmt
        easy_profiler
        ${CONFIGURE_DIRECTORY}
)