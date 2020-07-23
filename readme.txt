Template for CMake.

+---applications
"Main location for all executable targets."
|   \---app_example
|       +---include
|       |   \---app_example
|       \---src
+---cmake
"CMake scripts."
+---external
"Main location for third-party libraries that are potentially built from source."
|   +---ext_example1
|   |   +---bin
|   |   \---lib
|   \---ext_example2
|       +---include
|       |   \---ext_example2
|       \---src
+---examples
"Main location for examples (applications, libraries, whatever). Building of 
 examples can be controlled globally or on a per-target basis."
+---modules
"Main location for (static or dynamic) libraries."
    +---module_example1
    |   +---include
    |   |   \---module_example1
    |   \---src
    \---module_example2
        +---include
        |   \---module_example2
        \---src
\---modules


---- CMake scripts ----
ISA
	Provides options for enabling/disabling instruction sets for conditional compilation.
MakeTarget
	Mainly provides the make_target function.