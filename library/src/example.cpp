#include "example.h"

int dummy_noexept(int val) noexcept {
    int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
    return y;
}

int dummy(int val) {
    int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
    return y;
}

void Dummy_noexport::dummy_noexept(int val) noexcept {
    volatile int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
}

void Dummy::dummy(int val) {
    volatile int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
}
