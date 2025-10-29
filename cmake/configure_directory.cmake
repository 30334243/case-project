macro(configure_directory)
    # Большие тестируемые файлы лежат в домашней директории в ~/cxx/files/
    # тамже находится директория выходных данных
    set(EXTERNAL_DIRECTORY_FILES "$ENV{USERPROFILE}/cxx/files/")
    file(TO_CMAKE_PATH ${EXTERNAL_DIRECTORY_FILES} kEXTERNAL_DIRECTORY_FILES)
    configure_file(external_directory.h.in configure/external_directory.h)
    configure_file(clean_directory.h.in configure/clean_directory.h)
    configure_file(config.h.in configure/config.h)
    set(CONFIGURE_DIRECTORY configure_directory)
    add_library(${CONFIGURE_DIRECTORY} INTERFACE)
    target_include_directories(${CONFIGURE_DIRECTORY} INTERFACE "${CMAKE_BINARY_DIR}/configure" ${EXTERNAL_DIRECTORY_FILES})
endmacro()