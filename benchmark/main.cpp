#include "example.h"
#include <benchmark/benchmark.h>

static void BM_example_0(benchmark::State& state) {
    int y{};
    for (auto _: state) {
        benchmark::DoNotOptimize(y);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_0)->Arg(0)->Arg(1);

static void BM_example_1(benchmark::State& state) {
    int y{};
    for (auto _: state) {
        benchmark::DoNotOptimize(y);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_1)->Arg(0)->Arg(1);

BENCHMARK_MAIN();