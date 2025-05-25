file(GLOB dir_contents "${CMAKE_SOURCE_DIR}/3rdparty/windows/*")
if (NOT dir_contents)
    message(FATAL_ERROR "Run target \"cmake --build <build_tree> --target download_environment_<platform>\"")
endif ()
