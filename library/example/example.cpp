#include "example.h"

int dummy_noexept(int val) noexcept {
    EASY_FUNCTION(profiler::colors::Magenta);
    int y{};
    for (int i{}; i < val; ++i) {
        y += i;
    }
    return y;
}

int dummy(int val) {
    EASY_FUNCTION(profiler::colors::Blue500);
    int y{};
    for (int i{}; i < val; ++i) {
        y += i;
    }
    std::cout << fmt::format("\n0x{:X}\n", y);
    return y;
}

void Dummy_noexport::dummy_noexept(int val) noexcept {
    volatile int y{};
    for (int i{}; i < val; ++i) {
        y += i;
    }
}

void Dummy::dummy(int val) {
    volatile int y{};
    for (int i{}; i < val; ++i) {
        y += i;
    }
}
