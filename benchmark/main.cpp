#include "example.h"
#include <benchmark/benchmark.h>

static constexpr int kArg1 {100};
static constexpr int kArg2 {500};
static constexpr int kArg3 {100000};

// static void BM_example_function_noexcept(benchmark::State& state) {
//     for (auto _: state) {
//         dummy_noexept(state.range(0));
//     }
//     state.SetBytesProcessed(int64_t(state.iterations()) *
//                             int64_t(state.range(0)));
// }
// BENCHMARK(BM_example_function_noexcept)->Arg(kArg1)->Arg(kArg2);

// static void BM_example_function(benchmark::State& state) {
//     for (auto _: state) {
//         dummy(state.range(0));
//     }
//     state.SetBytesProcessed(int64_t(state.iterations()) *
//                             int64_t(state.range(0)));
// }
// BENCHMARK(BM_example_function)->Arg(kArg1)->Arg(kArg2);

// static void BM_example_struct_noexcept(benchmark::State& state) {
//     Dummy_noexport dummy {};
//     for (auto _: state) {
//         dummy.dummy_noexept(state.range(0));
//     }
//     state.SetBytesProcessed(int64_t(state.iterations()) *
//                             int64_t(state.range(0)));
// }
// BENCHMARK(BM_example_struct_noexcept)->Arg(kArg1)->Arg(kArg2);

// static void BM_example_struct(benchmark::State& state) {
//     Dummy dummy {};
//     for (auto _: state) {
//         dummy.dummy(state.range(0));
//     }
//     state.SetBytesProcessed(int64_t(state.iterations()) *
//                             int64_t(state.range(0)));
// }
// BENCHMARK(BM_example_struct)->Arg(kArg1)->Arg(kArg2);

static void BM_example_string_view(benchmark::State& state) {
    std::unordered_map<std::string, int> map {};
    map.reserve(10000);
    std::srand(std::time(0));
    for (auto _: state) {
        std_string_view(map, std::rand());
        benchmark::DoNotOptimize(map);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_string_view)->Arg(kArg1)->Arg(kArg2)->Arg(kArg3);

static void BM_example_string(benchmark::State& state) {
    std::unordered_map<std::string, int> map {};
    map.reserve(10000);
    std::srand(std::time(0));
    for (auto _: state) {
        std_string(map, std::rand());
        benchmark::DoNotOptimize(map);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_string)->Arg(kArg1)->Arg(kArg2)->Arg(kArg3);

static void BM_example_string_view_map(benchmark::State& state) {
    std::map<std::string, int> map {};
    std::srand(std::time(0));
    for (auto _: state) {
        std_string_view_map(map, std::rand());
        benchmark::DoNotOptimize(map);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_string_view_map)->Arg(kArg1)->Arg(kArg2)->Arg(kArg3);

static void BM_example_string_map(benchmark::State& state) {
    std::map<std::string, int> map {};
    std::srand(std::time(0));
    for (auto _: state) {
        std_string_map(map, std::rand());
        benchmark::DoNotOptimize(map);
        benchmark::ClobberMemory();
    }
    state.SetBytesProcessed(int64_t(state.iterations()) *
                            int64_t(state.range(0)));
}
BENCHMARK(BM_example_string_map)->Arg(kArg1)->Arg(kArg2)->Arg(kArg3);

BENCHMARK_MAIN();