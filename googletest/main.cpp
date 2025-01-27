#include "example.h"
#include <gtest/gtest.h>
#if defined(_MSC_VER)
#include <easy/profiler.h>
#endif

static constexpr int kIn_0{100};
static constexpr int kIn_1{10000};
static constexpr int kOut_0{4950};
static constexpr int kOut_1{49995000};

using test_value_t = std::tuple<int, int>;

struct ExampleTest : public testing::TestWithParam<test_value_t>
{
};

struct Cat
{
    Cat(int i) {}
    Cat &operator()(int i) {}
};

TEST_P(ExampleTest, case_dummy)
{
#if defined(_MSC_VER)
    EASY_FUNCTION(profiler::colors::Cyan);
#endif

    auto schrodinger{
        [](Cat)
        { return Cat(1); }};
        

    auto param{GetParam()};
    auto in{std::get<0>(param)};
    auto out{std::get<1>(param)};

    auto const res{dummy(in)};

    ASSERT_EQ(res, out);
}

TEST_P(ExampleTest, case_dummy_noexept)
{
#if defined(_MSC_VER)
    EASY_FUNCTION(profiler::colors::Red);
#endif
    auto param{GetParam()};
    auto in{std::get<0>(param)};
    auto out{std::get<1>(param)};

    auto const res{dummy_noexept(in)};

    ASSERT_EQ(res, out);
}

INSTANTIATE_TEST_SUITE_P(ExampleTests, ExampleTest, testing::Values(std::make_tuple(kIn_0, kOut_0), std::make_tuple(kIn_1, kOut_1)));

int main(int argc, char **argv)
{
#if defined(_MSC_VER)
    EASY_PROFILER_ENABLE;
#endif

    ::testing::InitGoogleTest(&argc, argv);
    auto res{RUN_ALL_TESTS()};

#if defined(_MSC_VER)
    profiler::dumpBlocksToFile("test_profile.prof");
#endif
    return res;
}