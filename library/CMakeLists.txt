include("${CMAKE_SOURCE_DIR}/cmake/user_functions.cmake")
include("${CMAKE_SOURCE_DIR}/cmake/exporting.cmake")

FILE(GLOB HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h")
FILE(GLOB SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

find_package(fmt CONFIG REQUIRED)
message("fmt=${fmt_VERSION}")
find_package(mongocxx CONFIG REQUIRED)
message("mongocxx=${mongocxx_VERSION}")

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

set(DEPENDENESIES fmt::fmt mongo::mongocxx_shared mongo::bsoncxx_shared mongo::mongoc_shared mongo::bson_shared)
if(WINDOWS_FLAG)
    list(APPEND DEPENDENESIES easy_profiler)
endif()
target_link_libraries(${PROJECT_NAME} PUBLIC ${DEPENDENESIES})
copy_dependencies(${PROJECT_NAME} ${DEPENDENESIES})

# if(ASTRA_FLAG)
#     target_link_libraries(${PROJECT_NAME} PUBLIC stdc++fs)
# endif()

exporting(${PROJECT_NAME})
