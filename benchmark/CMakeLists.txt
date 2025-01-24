include("${CMAKE_SOURCE_DIR}/cmake/add_benchmark_user_module.cmake")

add_benchmark_user_module(
    benchmark_${PROJECT_NAME}
    benchmark::benchmark
    ${PROJECT_NAME}
)
