from conans import ConanFile

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
        self.copy("*.cmake")
