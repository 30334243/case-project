#include "example.h"
#include <benchmark/benchmark.h>
#include <ctime>

static constexpr int kArg1 {100};
static constexpr int kArg2 {500};

static void BM_example_function_noexcept(benchmark::State& state) {
    for (auto _: state) {
        dummy_noexept(state.range(0));
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_function_noexcept)->Arg(kArg1)->Arg(kArg2);

static void BM_example_function(benchmark::State& state) {
    for (auto _: state) {
        dummy(state.range(0));
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_function)->Arg(kArg1)->Arg(kArg2);

static void BM_example_struct_noexcept(benchmark::State& state) {
    Dummy_noexport dummy {};
    for (auto _: state) {
        dummy.dummy_noexept(state.range(0));
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_struct_noexcept)->Arg(kArg1)->Arg(kArg2);

static void BM_example_struct(benchmark::State& state) {
    Dummy dummy {};
    for (auto _: state) {
        dummy.dummy(state.range(0));
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_struct)->Arg(kArg1)->Arg(kArg2);

BENCHMARK_MAIN();