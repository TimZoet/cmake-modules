from conan import ConanFile
from conan.tools.files import copy

class CMakeModulesConan(ConanFile):
    ############################################################################
    ## Package info.                                                          ##
    ############################################################################
    
    name = "cmake-modules"
    
    description = "CMake utility modules"
    
    url = "https://github.com/TimZoet/cmake-modules"
    
    license = "GNU AFFERO GENERAL PUBLIC LICENSE Version 3"
    
    author = "Tim Zoet"
    
    version = "1.0.0"
    
    exports_sources = "*"
    
    no_copy_source = True

    ############################################################################
    ## Building.                                                              ##
    ############################################################################

    def package(self):
        copy(self, "*.cmake", self.source_folder, self.package_folder)
        copy(self, "*.in", self.source_folder, self.package_folder)
        copy(self, "include/dummy.h", self.source_folder, self.package_folder)
