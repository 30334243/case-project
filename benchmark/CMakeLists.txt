set(INIT_DATA init_data)
add_library(${INIT_DATA} INTERFACE)
target_include_directories(
        ${INIT_DATA}
        INTERFACE
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
target_precompile_headers(${INIT_DATA} INTERFACE <algorithm> <benchmark/benchmark.h>)

add_subdirectory(cache)