from conans import ConanFile
from conan.tools.files import copy

class CMakeTemplateConan(ConanFile):
    ############################################################################
    ## Package info.                                                          ##
    ############################################################################
    
    name = "cmake-template"
    
    description = "CMake template"
    
    url = "https://github.com/TimZoet/cmake-template"
    
    version = "1.0.0"
    
    exports_sources = "*"
    
    no_copy_source = True

    ############################################################################
    ## Building.                                                              ##
    ############################################################################

    def package(self):
        print("cmake-template::package")
        copy(self, "*.cmake", self.source_folder, self.package_folder)
        copy(self, "include/dummy.h", self.source_folder, self.package_folder)
