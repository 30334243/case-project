include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")
include("${CMAKE_SOURCE_DIR}/cmake/exporting.cmake")

FILE(GLOB HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
FILE(GLOB SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

if(CMAKE_SHARED_LIBS)
    add_library(${PROJECT_NAME} SHARED ${HEADERS} ${SOURCES})
else()
    add_library(${PROJECT_NAME} STATIC ${HEADERS} ${SOURCES})
endif()
set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

target_include_directories(${PROJECT_NAME}
    PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
    "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)

target_link_libraries(${PROJECT_NAME} PUBLIC fmt::fmt easy_profiler)
copy_dependencies(${PROJECT_NAME} fmt::fmt easy_profiler)

# if(ASTRA_FLAG)
#     target_link_libraries(${PROJECT_NAME} PUBLIC stdc++fs)
# endif()

exporting(${PROJECT_NAME})
