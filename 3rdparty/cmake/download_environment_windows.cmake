set(PATH_3RDPARTY "${CMAKE_SOURCE_DIR}/")
add_custom_target(
        download_environment_windows
        COMMAND ${CMAKE_COMMAND} -E echo "Downloading file..."
        COMMAND ${CMAKE_COMMAND}
        -D URL=https://drive.google.com/uc?export=download&id=1uZq717ey7N7iq0UZLUjxmPvV0JY5aOcD
        -D DEST=${CMAKE_SOURCE_DIR}/windows.zip
        -P ${CMAKE_SOURCE_DIR}/cmake/download_file.cmake
        COMMENT "Downloading file from URL"
        COMMAND 7z x ${CMAKE_SOURCE_DIR}/windows.zip -o${CMAKE_SOURCE_DIR}/windows
        COMMENT "Extract arhive"
        COMMAND ${CMAKE_COMMAND} -E remove ${CMAKE_SOURCE_DIR}/windows.zip
        COMMENT "Clean"
        VERBATIM
)