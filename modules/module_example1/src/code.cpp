#include "module_example1/code.h"
#include "module_example2/code.h"

namespace module1
{
    int sqr(int a)
    {
        return module2::mul(a, a);
    }
}
