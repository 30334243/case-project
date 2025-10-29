#include "config.h"

EXPORT int dummy_noexept(int val) noexcept;
EXPORT int dummy(int val);

struct EXPORT Dummy_noexport {
    void dummy_noexept(int val) noexcept;
};

struct EXPORT Dummy {
    void dummy(int val);
};
