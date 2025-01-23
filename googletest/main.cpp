#include "example.h"
#include <gtest/gtest.h>

using test_value_t = int;

struct ExampleTest : public testing::TestWithParam<test_value_t> {};

TEST_P(ExampleTest, case_exapple_0) {
    auto in {GetParam()};
    dummy(in);
}

TEST_P(ExampleTest, case_exapple_1) {
    auto in {GetParam()};
    dummy(in);
}

INSTANTIATE_TEST_SUITE_P(ExampleTests, ExampleTest, testing::Values(0, 1));