list(APPEND CMAKE_MESSAGE_INDENT "[cache] ")
set(QUICKLY quickly)
add_subdirectory(quickly)
set(SLOWLY slowly)
add_subdirectory(slowly)

add_custom_target(
        diff_cache
        COMMAND ${QUICKLY} "--benchmark_out=${QUICKLY}.json" "--benchmark_out_format=json" "--benchmark_repetitions=10"
        COMMAND ${SLOWLY} "--benchmark_out=${SLOWLY}.json" "--benchmark_out_format=json" "--benchmark_repetitions=10"
        COMMAND gbenchdiff "${CMAKE_CURRENT_BINARY_DIR}/${QUICKLY}.json" "${CMAKE_CURRENT_BINARY_DIR}/${SLOWLY}.json"
        COMMENT "Diff benchmarks: ${QUICKLY} and ${SLOWLY}"
)