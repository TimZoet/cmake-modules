Template for CMake.

(generated on Windows using 'tree /A')
+---applications
|   \---app_example
|       +---include
|       |   \---app_example
|       \---src
+---cmake
+---examples
|   +---example_app
|   |   +---include
|   |   |   \---example_app
|   |   \---src
|   \---example_lib
|       +---include
|       |   \---example_lib
|       \---src
+---external
|   +---ext_example1
|   |   +---bin
|   |   \---lib
|   \---ext_example2
|       +---include
|       |   \---ext_example2
|       \---src
+---modules
|   +---module_example1
|   |   +---include
|   |   |   \---module_example1
|   |   \---src
|   \---module_example2
|       +---include
|       |   \---module_example2
|       \---src
\---tests

---- applications ----
Main location for all executable targets.

---- cmake ----
Main location for CMake scripts. Below a list of the most important scripts. See
the scripts themselves for more documentation describing how to use the main 
functions.

ISA.cmake
	Provides options for enabling/disabling instruction sets for conditional 
	compilation.

MakeTarget.cmake
	Mainly provides the make_target function.

---- examples ----
Main location for examples (applications, libraries, whatever). Building of 
examples can be controlled globally or even on a per-target basis.

---- external ----
Main location for third-party libraries that are potentially built from source.

---- modules ----
Main location for (static or dynamic) libraries.

---- tests ----
Main location for test applications.