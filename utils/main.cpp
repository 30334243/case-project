#include "example.h"
#include "external_directory.h"

int main() {
    std::cout << kEXTERNAL_DIRECTORY_FILES << std::endl;
    std::cout << kEXTERNAL_OUT_DIRECTORY_FILES << std::endl;
    std::cout << kEXTERNAL_STANDARD_DIRECTORY_FILES << std::endl;
    std::cout << dummy(8) << std::endl;
    return 0;
}
