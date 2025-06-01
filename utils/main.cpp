#include "example.h"
#include "external_directory.h"

int main()
{
    EASY_PROFILER_ENABLE;
    std::cout << kEXTERNAL_DIRECTORY_FILES << std::endl;
    std::cout << kEXTERNAL_OUT_DIRECTORY_FILES << std::endl;
    std::cout << kEXTERNAL_STANDARD_DIRECTORY_FILES << std::endl;
    for (int y{}; y < 1000; ++y)
    {
        std::cout << dummy(8) << std::endl;
        std::cout << dummy_noexept(8) << std::endl;
    }
    profiler::dumpBlocksToFile("test_profile.prof");
    return 0;
}
