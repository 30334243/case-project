function(copy_dependencies NAME)
    if (ARGN)
        foreach (dependence IN LISTS ARGN)
            add_custom_command(TARGET ${NAME} POST_BUILD
                    COMMAND ${CMAKE_COMMAND} -E echo "Copying required library for dependency"
                    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${dependence}> $<TARGET_FILE_DIR:${NAME}>
                    VERBATIM)
        endforeach ()
    else ()
        message(FATAL_ERROR "No arguments are given")
    endif ()
endfunction()