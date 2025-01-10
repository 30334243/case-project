include("${CMAKE_SOURCE_DIR}/cmake/add_test_user_module.cmake")

add_test_user_module(
        test_${PROJECT_NAME}
        GTest::gtest
        GTest::gtest_main
        ${PROJECT_NAME}
)

# add_custom_command(TARGET test_${PROJECT_NAME} POST_BUILD
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/files"
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_BINARY_DIR}/test/files"
# )