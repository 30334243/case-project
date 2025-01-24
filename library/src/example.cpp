#include "example.h"

void dummy_noexept(int val) noexcept {
    volatile int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
}


void dummy(int val) {
    volatile int y {};
    for (int i {}; i < val; ++i) {
        y += i;
    }
}

void std_string_view(std::unordered_map<std::string, int>& map, int i) {
    std::string_view str {"123456789abcdef123456789"};
    map[str.data()] = i;
}

void std_string(std::unordered_map<std::string, int>& map, int i) {
    std::string const str {"123456789abcdef123456789"};
    map[str] = i;
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
