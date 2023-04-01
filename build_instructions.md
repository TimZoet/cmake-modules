# Build Instructions

This project can only be used as a Conan package. It does not perform any compilation and merely makes the CMake scripts available with some additional configuration in your `conanfile.py`.

## Getting the Code

To retrieve the code from GitHub:

```cmd
git clone https://github.com/TimZoet/cmake-modules.git source
```

## Exporting to Conan

To export the `cmake-modules` package to your local Conan cache:

```cmd
conan export --user timzoet --channel v1.0.0 source
```

Make sure to update the channel when the version is different.

## Including the Package

To include the package from your `conanfile.py`:

```py
def requirements(self):
    self.requires("cmake-modules/1.0.0@timzoet/v1.0.0")
```

To inform CMake of the path that must be added to `CMAKE_MODULE_PATH`:

```py
def generate(self):
    base = self.python_requires["pyreq"].module.BaseConan
    
    tc = CMakeToolchain(self)
    tc.variables["TZ_CMAKE_MODULES_DIR"] = os.path.dirname(conan_file.dependencies["cmake-modules"].cpp_info.components[None].includedir).replace(os.sep, "/")
    tc.generate()
    
    deps = CMakeDeps(self)
    deps.generate()
```

In the root `CMakeLists.txt` of your project:

```cmake
set(TZ_CMAKE_MODULES_DIR "" CACHE PATH "Path to the cmake-modules package directory")
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${TZ_CMAKE_MODULES_DIR}")

# Modules are now available for include.
include(MakeTarget)
```
