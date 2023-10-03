#include <iostream>

#include "srcs/return_a.hpp"
#include "srcs/return_b.hpp"
#include "srcs/return_c.hpp"

void printer() {
    std::cout << return_a() << std::endl;
    std::cout << return_b() << std::endl;
    std::cout << return_c() << std::endl;
}

