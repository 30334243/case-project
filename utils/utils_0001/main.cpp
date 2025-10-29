#include "lib_2.h"
#include <external_directory.h>
#include <easy/profiler.h>
#include <fmt/core.h>

int main()
{
    EASY_PROFILER_ENABLE;
    fmt::print("{}", kEXTERNAL_DIRECTORY_FILES.string());
    fmt::print("{}", kEXTERNAL_OUT_DIRECTORY_FILES.string());
    fmt::print("{}", kEXTERNAL_STANDARD_DIRECTORY_FILES.string());
    for (int y{}; y < 1000; ++y)
    {
        fmt::print("{}", dummy(8));
        fmt::print("{}", dummy_noexept(8));
    }
    profiler::dumpBlocksToFile("test_profile.prof");
    return 0;
}
