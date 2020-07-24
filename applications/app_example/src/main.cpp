#include <iostream>

#include "module_example1/code.h"

int main()
{
    std::cout << "Hello!" << std::endl;
    std::cout << "module1::sqr(9) = " << module1::sqr(9) << std::endl;
    return 0;
}