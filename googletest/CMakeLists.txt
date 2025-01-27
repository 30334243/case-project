include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")
set(NAME googletest_${PROJECT_NAME})
set(DEPEDENCIES GTest::gtest GTest::gtest_main)

add_executable(${NAME} main.cpp)
target_link_libraries(${NAME} PRIVATE ${DEPEDENCIES} ${PROJECT_NAME})
copy_dependencies(${NAME} ${DEPEDENCIES})

set_target_properties(${NAME} PROPERTIES
        FOLDER Tests
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
)
add_test(NAME ${NAME} COMMAND ${NAME})

# add_custom_command(TARGET test_${PROJECT_NAME} POST_BUILD
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/files"
#         COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_BINARY_DIR}/test/files"
# )