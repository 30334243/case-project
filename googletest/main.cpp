#include "example.h"
#include <gtest/gtest.h>

static constexpr int kIn_0 {100};
static constexpr int kIn_1 {500};
static constexpr int kOut_0 {4950};
static constexpr int kOut_1 {124750};

using test_value_t = std::tuple<int, int>;

struct ExampleTest : public testing::TestWithParam<test_value_t> {};

TEST_P(ExampleTest, case_exapple_0) {
    auto param {GetParam()};
    auto in {std::get<0>(param)};
    auto out {std::get<1>(param)};

    auto const res {dummy(in)};

    ASSERT_EQ(res, out);
}

TEST_P(ExampleTest, case_exapple_1) {
    auto param {GetParam()};
    auto in {std::get<0>(param)};
    auto out {std::get<1>(param)};

    auto const res {dummy_noexept(in)};

    ASSERT_EQ(res, out);
}

INSTANTIATE_TEST_SUITE_P(ExampleTests, ExampleTest, testing::Values(std::make_tuple(kIn_0, kOut_0),std::make_tuple(kIn_1, kOut_1)));