#include "example.h"
#include <iostream>

int main(int argc, char** argv) {
    auto const res {dummy(1)};
    std::cout << "Work dummy=" << res << std::endl;
    return res;
}