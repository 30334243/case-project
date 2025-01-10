function(exporting NAME)
    include(GNUInstallDirs)
    #--------------------------------------------------------------
    #------------------CREATE EXPORT-------------------------------
    #--------------------------------------------------------------
    install(TARGETS ${NAME}
            EXPORT ${NAME}Targets
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

    FILE(GLOB HEADERS "include/*.h")
    install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    install(EXPORT ${NAME}Targets
            FILE ${NAME}Targets.cmake
            NAMESPACE ${NAME}::
            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${NAME}
    )

    #--------------------------------------------------------------
    #------------------CREATE VERSION------------------------------
    #--------------------------------------------------------------
    include(CMakePackageConfigHelpers)

    set(version 1.1.1)

    set_property(TARGET ${NAME} PROPERTY VERSION ${version})
    set_property(TARGET ${NAME} PROPERTY SOVERSION 3)
    set_property(TARGET ${NAME} PROPERTY
            INTERFACE_${NAME}MAJOR_VERSION 3)
    set_property(TARGET ${NAME} APPEND PROPERTY
            COMPATIBLE_INTERFACE_STRING ${NAME}
    )

    write_basic_package_version_file(
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}ConfigVersion.cmake"
            VERSION "${version}"
            COMPATIBILITY AnyNewerVersion
    )
    #--------------------------------------------------------------
    #------------------CREATE CONFIG FILE--------------------------
    #--------------------------------------------------------------
    configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}Config.cmake"
            INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${NAME}
    )
    #--------------------------------------------------------------
    #------------------INSTALL-------------------------------------
    #--------------------------------------------------------------
    install(FILES
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}Config.cmake"
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}ConfigVersion.cmake"
            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${NAME}
    )
    #--------------------------------------------------------------
    #------------------GENERATE EXPORT-----------------------------
    #--------------------------------------------------------------
    export(EXPORT ${NAME}Targets
            FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/${NAME}Targets.cmake"
            NAMESPACE ${NAME}::
    )
endfunction()