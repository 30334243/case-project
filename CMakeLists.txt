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
    enable_testing()
    set(CMAKE_CXX_STANDARD 17)

    # Большие тестируемые файлы лежат в домашней директории в ~/cxx/files/
    # тамже находится директория выходных данных
    set(EXTERNAL_DIRECTORY_FILES "$ENV{USERPROFILE}/cxx/files/")
    file(TO_CMAKE_PATH ${EXTERNAL_DIRECTORY_FILES} kEXTERNAL_DIRECTORY_FILES)
    configure_file(external_directory.h.in configure/external_directory.h)
    configure_file(config.h.in configure/config.h)
    set(CONFIGURE_DIRECTORY configure_directory)
    add_library(${CONFIGURE_DIRECTORY} INTERFACE)
    target_include_directories(${CONFIGURE_DIRECTORY} INTERFACE "${CMAKE_BINARY_DIR}/configure")

    list(APPEND CMAKE_MESSAGE_INDENT "[${PROJECT_NAME}] ")
    find_package(fmt CONFIG REQUIRED)
    message(STATUS " -> fmt=${fmt_VERSION}")
    find_package(Boost CONFIG REQUIRED)
    message(STATUS "-> Boost=${Boost_VERSION}")
    find_package(GTest CONFIG REQUIRED)
    message(STATUS "-> GTest=${GTest_VERSION}")
    find_package(benchmark CONFIG REQUIRED)
    message(STATUS "-> benchmark=${benchmark_VERSION}")
    find_package(nlohmann_json CONFIG REQUIRED)
    message(STATUS "-> nlohmann_json=${nlohmann_json_VERSION}")

    set(LIB_OBJ lib_obj)
    set(LIB_STATIC lib_static)
    set(LIB_SHARED lib_shared)
    add_subdirectory(library)
    add_subdirectory(utils)
    add_subdirectory(gtest)
    add_subdirectory(benchmark)

endif ()
