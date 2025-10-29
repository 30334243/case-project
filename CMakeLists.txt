cmake_minimum_required(VERSION 3.13.0)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/$<CONFIG>$<0:>)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

project(case-project)

file(GLOB environment_contents "${CMAKE_SOURCE_DIR}/3rdparty/*")
if (${CMAKE_SYSTEM_NAME} STREQUAL "Windows" OR ${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT environment_contents)
    include(download_environment_windows)
    message(WARNING
            "***************************************************************\n"
            "Launch the environment download target:\n\"cmake --build <buid-tree> --target download_environment\"\n"
            "***************************************************************\n"
    )
else ()
    include(CPack)
    include(CTest)
    include(configure_directory)
    enable_testing()
    set(CMAKE_CXX_STANDARD 17)

    configure_directory()

    list(APPEND CMAKE_MESSAGE_INDENT "[${PROJECT_NAME}] ")
    find_package(easy_profiler CONFIG REQUIRED)
    message(STATUS "-> easy_profiler=${easy_profiler_VERSION}")
    find_package(benchmark CONFIG REQUIRED)
    message(STATUS "-> benchmark=${benchmark_VERSION}")
    find_package(Boost CONFIG REQUIRED)
    message(STATUS "-> Boost=${Boost_VERSION}")
    find_package(GTest CONFIG REQUIRED)
    message(STATUS "-> GTest=${GTest_VERSION}")
    find_package(fmt CONFIG REQUIRED)
    message(STATUS "-> fmt=${fmt_VERSION}")
    find_package(nlohmann_json CONFIG REQUIRED)
    message(STATUS "-> nlohmann_json=${nlohmann_json_VERSION}")

    set(LIB_OBJ lib_obj)
    set(LIB_STATIC lib_static)
    set(LIB_SHARED lib_shared)

    set(LIB_2_OBJ lib_2_obj)
    set(LIB_2_STATIC lib_2_static)
    set(LIB_2_SHARED lib_2_shared)

    add_subdirectory(library)
    add_subdirectory(utils)
    add_subdirectory(gtest)
    add_subdirectory(benchmark)

endif ()
