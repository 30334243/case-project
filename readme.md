# **Скелет проекта**
~~~
-project
|  -3rdparty
|  |  -windows
|  |  |  -vs-2019
|  |  |  |  -<lib>
|  |  |  |  ...
|  |  |  ...
|  |  -linux
|  |  |  -<lib>-debug
|  |  |  -<lib>-release
|  |  |  ...
|  -lib
|  |  -include
|  |  -src
|  |  CMakeLists.txt
|  |  Config.cmake.in
|  -test
|  |  CMakeLists.txt
|  |  main.cpp
|  -presets
|  |  -linux
|  |  |  -lib
|  |  |  |  wrokflow.json
|  |  |  -test
|  |  |  |  test.json
|  |  |  |  wrokflow.json
|  |  |  config.json
|  |  |  build.json
|  |  |  package.json
|  |  |  paths.json
|  |  -windows
|  |  |  -vs-2019
|  |  |  ...
|  |  |  paths.json
|  |  |  windows.json
|  |  environment.json
|  |  test.json
|  -cmake
|  |  add_test_user_module.cmake
|  |  exporting.cmake
|  |  user_functions.cmake
|  .gitignore
|  CMakePresets.json
|  CMakeLists.txt
|  readme.md
~~~
# **Обязательные изменения**
1. Изменить имя проекта в `CMakeLists.txt`
    ~~~
    project(<name_project>)
    ~~~
1. В файле `presets/environment.json` изменить имя проекта на свое
    ~~~
    {
    ...
    "configurePresets": [
        {
            "name": "environment",
            "hidden": true,
            "environment": {
                "PROJECT_NAME": "<name_project>"
            }
        }
    ]
    ...
    }
    ~~~
 2. В файле `presets/test.json` изменить имена тестов (если тестов несколько использовать `"name": "<name_tests1>|<name_tests2>"` или удалить фильтр)
    ~~~
    ...
    "filter": {
        "include": {
            "name": "<name_tests>"
        }
    }
    ...
    ~~~
# **Опциональные изменения**
1. В файле `presets/windows.json` установить свои переменные
    ~~~
    ...
    "cacheVariables": {
        "WINDOWS_FLAG": "ON",
        "OPS_TEST": "ON",
        "OPS_BENCHMARK": "ON",
        "GTest_DIR": "$env{USERPROFILE}/cxx/$env{PROJECT_NAME}/3rdparty/windows/vs-2019/GTest/lib/cmake/GTest",
        "fmt_DIR": "$env{USERPROFILE}/cxx/$env{PROJECT_NAME}/3rdparty/windows/vs-2019/fmt/lib/cmake/fmt"
    }
    ...
    ~~~
2. В файле `presets/linux/config.json` установить свои переменные
    ~~~
    {
    ...
    "cacheVariables": {
        "ASTRA_FLAG": "ON"
    }
    ...
    }
    ~~~
3. Для `astra` подключить `filesystem` (если нужно) в `lib/CMakeLists.txt`
    ~~~
    if(ASTRA_FLAG)
        target_link_libraries(${PROJECT_NAME} PUBLIC stdc++fs)
    endif()
    ~~~
1. Переменные в конфигурации в `Linux` для `release` и `debug` 
    ~~~
    ...
    "name": "linux-debug",
    "inherits": [
        "linux"
    ],
    "cacheVariables": {
        "CMAKE_BUILD_TYPE": "Debug",
        "GTest_DIR": "$env{HOME}/cxx/$env{PROJECT_NAME}/3rdparty/linux/GTest-debug/lib/cmake/GTest"
    }
    ...
    ~~~
2. Добавить копирование тестовых файлов в `test/CMakeLists.txt` (если нужно)
    ~~~
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/files"
            COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/files" "${CMAKE_BINARY_DIR}/test/files"
    )
    ~~~
3. Добавить поиск необходимых библиотек в `CMakeLists.txt`
    ~~~
    find_package(GTest CONFIG REQUIRED)
    message("GTest=${GTest_VERSION}")
    ~~~
4. Добавить переменные cmake в исходники (если нужно)
    ~~~
    add_definitions(-DWINDOWS_FLAG)
    ~~~