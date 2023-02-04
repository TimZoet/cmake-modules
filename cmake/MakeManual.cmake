option(BUILD_MANUAL "Build manual target" OFF)
set(MANUAL_REPOSITORY "" CACHE STRING "Repository URL")
set(MANUAL_TAG "master" CACHE STRING "Branch/tag to retrieve")

function(make_manual)
    set(INDEX_SOURCE ${CMAKE_BINARY_DIR}/manual/source/index.rst)
    set(INDEX_HTML ${CMAKE_BINARY_DIR}/manual/build/html/index.html)
    add_custom_command(
        COMMAND git clone --depth 1 --branch ${MANUAL_TAG} ${MANUAL_REPOSITORY} ${CMAKE_BINARY_DIR}/manual/source
        OUTPUT ${INDEX_SOURCE}
        COMMENT "Checkout manual"
    )
    add_custom_command(
        DEPENDS ${INDEX_SOURCE}
        COMMAND sphinx-build -M html ${CMAKE_BINARY_DIR}/manual/source ${CMAKE_BINARY_DIR}/manual/build
        OUTPUT ${INDEX_HTML}
        COMMENT "Build manual"
    )
    add_custom_target(
        MANUAL
        DEPENDS ${INDEX_HTML}
    )
    get_property(FOLDER GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER)
    set_target_properties(MANUAL PROPERTIES FOLDER ${FOLDER})
    
    install(
        DIRECTORY ${CMAKE_BINARY_DIR}/manual/build/html/
        DESTINATION manual
    )
endfunction(make_manual)
