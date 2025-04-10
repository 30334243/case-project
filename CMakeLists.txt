cmake_minimum_required(VERSION 3.13.0)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)

project(case-project)
include(CPack)
include(CTest)
enable_testing()
set(CMAKE_CXX_STANDARD 17)

if(IS_APPLICATION)
    add_subdirectory(library)
    add_subdirectory(application)
elseif(IS_LIBRARY)
    add_subdirectory(library)
elseif(IS_GOOGLETEST)
    add_definitions(-DIS_GOOGLETEST)
    add_subdirectory(library)

    find_package(GTest CONFIG REQUIRED)
    message("GTest=${GTest_VERSION}")

    add_subdirectory(googletest)
elseif(IS_BENCHMARK)
    add_definitions(-DIS_BENCHMARK)
    add_subdirectory(library)

    find_package(benchmark CONFIG REQUIRED)
    message("benchmark=${benchmark_VERSION}")

    add_subdirectory(benchmark)
endif()

