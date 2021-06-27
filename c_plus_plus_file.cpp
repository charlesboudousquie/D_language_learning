

// to compile outside visual studio, use following commands:
// g++ -c c_plus_plus_file.cpp
// dmd visual_d_test.d c_plus_plus_file.o -L -lstdc++ && ./visual_d_test

//https://dlang.org/spec/cpp_interface.html

#include <iostream>

int c_function(int i, int j, int k)
{
    std::cout << "i = " << i << std::endl;
    std::cout << "j = " << j << std::endl;
    std::cout << "k = " << k << std::endl;

    return 7;
}
