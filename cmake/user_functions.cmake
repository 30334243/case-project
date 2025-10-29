function(copy_dependencies NAME)
    collect_all_deps(all_dependences ${NAME})
    if (all_dependences)
        foreach (dependence IN LISTS all_dependences)
            get_target_property(dependence_type ${dependence} TYPE)
            if (dependence_type STREQUAL "SHARED_LIBRARY" OR dependence_type STREQUAL "EXECUTABLE")
                add_custom_command(TARGET ${NAME} POST_BUILD
                        COMMAND ${CMAKE_COMMAND} -E echo "Copying required library for dependency"
                        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${dependence}> $<TARGET_FILE_DIR:${NAME}>
                        VERBATIM)
            endif ()
        endforeach ()
    else ()
        message(FATAL_ERROR "No arguments are given")
    endif ()
endfunction()

function(collect_all_deps out_var target)
    set(result "")

    # берем прямые зависимости
    get_target_property(libs ${target} LINK_LIBRARIES)
    if (NOT libs)
        set(libs "")
    endif ()

    get_target_property(iface_libs ${target} INTERFACE_LINK_LIBRARIES)
    if (NOT iface_libs)
        set(iface_libs "")
    endif ()

    list(APPEND libs ${iface_libs})

    foreach (lib IN LISTS libs)
        if (TARGET ${lib})
            list(APPEND result ${lib})
            # рекурсия
            collect_all_deps(sub_deps ${lib})
            list(APPEND result ${sub_deps})
        endif ()
    endforeach ()

    list(REMOVE_DUPLICATES result)
    set(${out_var} "${result}" PARENT_SCOPE)
endfunction()

function(add_gtest)
    set(oneValueArgs NAME)
    set(multiValueArgs LIBRARIES SOURCES)
    cmake_parse_arguments(MY "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_executable(${MY_NAME} ${MY_SOURCES})
    target_link_libraries(${MY_NAME} PRIVATE ${MY_LIBRARIES})

    add_test(NAME ${MY_NAME} COMMAND ${MY_NAME})

    copy_dependencies(${MY_NAME})
endfunction()

function(add_user_lib)
    set(oneValueArgs NAME)
    set(multiValueArgs LIBRARIES SOURCES)
    cmake_parse_arguments(MY "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${MY_NAME} OBJECT ${MY_SOURCES})
    target_include_directories(${MY_NAME}
            PUBLIC
            "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
            "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
    )
    target_link_libraries(${MY_NAME} PUBLIC ${MY_LIBRARIES})
    set_target_properties(${MY_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON)

    add_subdirectory(shared)
    add_subdirectory(static)
endfunction()
