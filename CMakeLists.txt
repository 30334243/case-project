cmake_minimum_required(VERSION 3.13.0)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)

project(bitreader)
include(CPack)
include(CTest)
enable_testing()
set(CMAKE_CXX_STANDARD 17)

find_package(GTest CONFIG REQUIRED)
message("GTest=${GTest_VERSION}")

add_subdirectory(lib)
add_subdirectory(test)
