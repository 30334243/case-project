#include "init_data.h"

static void BM_cache(benchmark::State &state) {
    auto const size{state.range(0)};
    std::vector<std::vector<uint8_t> > a{};
    init_double_vec(size, size, a);

    for (auto _: state) {
        for (int i{}; i < size; ++i) {
            for (int j{}; j < size; ++j) {
                a[j][i] = 0xaa;
            }
        }
    }

    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}

BENCHMARK(BM_cache)->Range(8, 8 << 10);

BENCHMARK_MAIN();
