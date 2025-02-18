# include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")

function(add_cmake_project)
    set(oneValueArgs TARGET SOURCES_PATH)
    set(multiValueArgs DEPENDENCIES)
    cmake_parse_arguments(arg "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    FILE(GLOB HEADERS "${arg_SOURCES_PATH}/*.h")
    FILE(GLOB SOURCES "${arg_SOURCES_PATH}/*.cpp")
    add_executable(${arg_TARGET} ${HEADERS} ${SOURCES})
    target_link_libraries(${arg_TARGET} PRIVATE ${arg_DEPENDENCIES})
    copy_dependencies(${arg_TARGET} ${arg_DEPENDENCIES})

    add_test(NAME ${arg_TARGET} COMMAND ${arg_TARGET})
endfunction()
