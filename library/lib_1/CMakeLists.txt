include(user_functions)

add_user_lib(NAME ${LIB_OBJ} SOURCES lib_1.cpp
        LIBRARIES
        Boost::boost
        fmt::fmt
        easy_profiler
        ${CONFIGURE_DIRECTORY}
)
