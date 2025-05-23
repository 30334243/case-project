include(user_functions)

add_executable(${SLOWLY} main.cpp)
target_link_libraries(${SLOWLY} PRIVATE benchmark::benchmark ${LIB_STATIC} ${INIT_DATA})

list(APPEND CMAKE_MESSAGE_INDENT "[${SLOWLY}] ")
copy_dependencies(${SLOWLY} benchmark::benchmark)
