#include <iostream>

#include "example_lib/code.h"
#include "example_lib_with_pkg/code.h"

int main()
{
    std::cout << "Hello!" << std::endl;
    std::cout << "lib1::add(12, 30) = " << lib1::add(12, 30) << std::endl;
    std::cout << "lib2::print_json(4.123456789f) = ";
    lib2::print_json(4.123456789f);
    std::cout << std::endl;
    return 0;
}