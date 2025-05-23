include(user_functions)

add_executable(${QUICKLY} main.cpp)
target_link_libraries(${QUICKLY} PRIVATE benchmark::benchmark ${LIB_STATIC} ${INIT_DATA})

list(APPEND CMAKE_MESSAGE_INDENT "[${QUICKLY}] ")
copy_dependencies(${QUICKLY} benchmark::benchmark)
