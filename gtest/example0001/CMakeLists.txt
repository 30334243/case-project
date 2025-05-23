include(user_functions)

set(TARGET_NAME gtest_0001)
add_executable(${TARGET_NAME} main.cpp)
target_link_libraries(
        ${TARGET_NAME}
        PRIVATE
        GTest::gtest
        GTest::gtest_main
        ${LIB_STATIC}
        ${EXTERNAL_DIRECTORY}
        ${GTEST_FILES}
)

list(APPEND CMAKE_MESSAGE_INDENT "[${TARGET_NAME}] ")
copy_dependencies(${TARGET_NAME} GTest::gtest GTest::gtest_main fmt::fmt)

add_test(NAME ${TARGET_NAME} COMMAND ${TARGET_NAME})