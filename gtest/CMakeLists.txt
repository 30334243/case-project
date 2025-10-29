set(TARGET_GTEST target_gtest)
add_library(${TARGET_GTEST} INTERFACE)
target_link_libraries(
        ${TARGET_GTEST}
        INTERFACE
        GTest::gtest
        GTest::gtest_main
        ${CONFIGURE_DIRECTORY}
)

add_subdirectory(gtest_0000)
add_subdirectory(gtest_0001)
