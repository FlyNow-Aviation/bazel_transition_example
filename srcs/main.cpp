#include <iostream>

#include "add.hpp"
#include "returner.hpp"

int main() {
    std::cout << "add 1 + 2: " << add(1, 2) << std::endl;
    printer();
    return 0;
}
