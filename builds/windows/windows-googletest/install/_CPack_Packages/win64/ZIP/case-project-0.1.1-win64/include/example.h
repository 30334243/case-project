#include <cstdint>
#include <fmt/core.h>
#include <unordered_map>
#include <map>

#if defined(_MSC_VER)
//  Microsoft
#define EXPORT __declspec(dllexport)
#define IMPORT __declspec(dllimport)
#elif defined(__GNUC__)
//  GCC
#define EXPORT __attribute__((visibility("default")))
#define IMPORT
#else
//  do nothing and hope for the best?
#define EXPORT
#define IMPORT
#pragma warning Unknown dynamic link import / export semantics.
#endif

EXPORT int dummy_noexept(int val) noexcept;
EXPORT int dummy(int val);

struct EXPORT Dummy_noexport {
    void dummy_noexept(int val) noexcept;
};

struct EXPORT Dummy {
    void dummy(int val);
};
