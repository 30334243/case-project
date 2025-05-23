#pragma once

using double_vec_t = std::vector<std::vector<uint8_t> >;

void init_double_vec(uint64_t const x, uint64_t const y, double_vec_t &dvec) {
    dvec.resize(x);
    for (auto &elm: dvec) {
        elm.resize(y);
    }
}