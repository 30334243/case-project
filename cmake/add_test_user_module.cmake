include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")

# Фукнция добавления теста в проект
function(add_test_user_module NAME)
    add_executable(${NAME} main.cpp)
    if (ARGN)
        target_link_libraries(${NAME} PRIVATE ${ARGN})
        
        set_target_properties(${NAME} PROPERTIES
            FOLDER Tests
            LIBRARY_OUTPUT_DIRECTORY  ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
            RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
            ARCHIVE_OUTPUT_DIRECTORY  ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}
        )
    endif ()
    add_test(NAME ${NAME} COMMAND ${NAME})
endfunction()