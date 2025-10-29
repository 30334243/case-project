include(user_functions)

add_gtest(NAME gtest_0000 SOURCES main.cpp
        LIBRARIES
        ${LIB_STATIC}
        ${TARGET_GTEST}
)
