include("${CMAKE_SOURCE_DIR}/cmake/cmake_project.cmake")

add_cmake_project(
    TARGET googletest_case_project_${PROJECT_NAME}
    SOURCES_PATH ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDENCIES GTest::gtest GTest::gtest_main ${PROJECT_NAME}
)

# add_custom_command(TARGET test_${PROJECT_NAME} POST_BUILD
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/files"
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_BINARY_DIR}/test/files"
# )