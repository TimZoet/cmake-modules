#include "example_lib_with_pkg/code.h"

#include <iostream>
#include <string>

#include "nlohmann/json.hpp"

namespace lib2
{
    void print_json(float x)
    {
        nlohmann::json json;
        json["x"] = x;
        std::cout << json.dump(2);
    }
}
