set(PATH_3RDPARTY "${CMAKE_SOURCE_DIR}/3rdparty")
add_custom_target(
        download_environment
        COMMAND ${CMAKE_COMMAND} -E echo "Downloading file..."
        COMMAND ${CMAKE_COMMAND}
        -D URL=https://github.com/30334243/environment/archive/refs/heads/main.zip
        -D DEST=${PATH_3RDPARTY}/environment.zip
        -P ${CMAKE_SOURCE_DIR}/cmake/download_file.cmake
        COMMENT "Downloading file from URL"
        COMMAND 7z x ${PATH_3RDPARTY}/environment.zip -o${PATH_3RDPARTY}
        COMMENT "Extract arhive"
        COMMAND ${CMAKE_COMMAND} -E remove ${PATH_3RDPARTY}/environment.zip
        COMMENT "Clean"
        VERBATIM
)