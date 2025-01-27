include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")
set(NAME benchmark_${PROJECT_NAME})
set(DEPEDENCIES benchmark::benchmark)

add_executable(${NAME} main.cpp)
target_link_libraries(${NAME} PRIVATE ${DEPEDENCIES} ${PROJECT_NAME})
copy_dependencies(${NAME} ${DEPEDENCIES})

set_target_properties(${NAME} PROPERTIES
    FOLDER Benchmark
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
)
add_test(NAME ${NAME} COMMAND ${NAME})
