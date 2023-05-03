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
    
    version = "1.0.1"
    
    exports_sources = "*"
    
    no_copy_source = True

    @property
    def user(self):
        return getattr(self, "_user", "timzoet")
    
    @user.setter
    def user(self, value):
        self._user = value
    
    @property
    def channel(self):
        return getattr(self, "_channel", f"v{self.version}")
    
    @channel.setter
    def channel(self, value):
        self._channel = value

    ############################################################################
    ## Building.                                                              ##
    ############################################################################

    def package(self):
        copy(self, "*.cmake", self.source_folder, self.package_folder)
        copy(self, "*.in", self.source_folder, self.package_folder)
        copy(self, "include/dummy.h", self.source_folder, self.package_folder)
