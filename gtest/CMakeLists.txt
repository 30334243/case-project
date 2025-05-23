set(GTEST_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}")
set(GTEST_BIN_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
configure_file(gtest_files.h.in configure_gtest/gtest_files.h)

set(GTEST_FILES gtest_files)
add_library(${GTEST_FILES} INTERFACE)
target_include_directories(${GTEST_FILES} INTERFACE "${CMAKE_BINARY_DIR}/gtest/configure_gtest")
target_precompile_headers(${GTEST_FILES} INTERFACE <gtest/gtest.h>)

add_subdirectory(example0000)
add_subdirectory(example0001)
