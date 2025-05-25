set(TARGET_GTEST target_gtest)
add_library(${TARGET_GTEST} INTERFACE)
target_link_libraries(
        ${TARGET_GTEST}
        INTERFACE
        GTest::gtest
        GTest::gtest_main
        ${LIB_STATIC}
        ${EXTERNAL_DIRECTORY}
)
target_precompile_headers(${TARGET_GTEST} INTERFACE <gtest/gtest.h>)

add_subdirectory(example0000)
add_subdirectory(example0001)
