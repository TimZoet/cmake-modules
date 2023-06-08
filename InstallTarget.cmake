option(USE_CONAN "Rely on Conan for exporting of targets and writing config files" OFF)

function(install_parse)
    cmake_parse_arguments(
        PARSED_ARGS
        ""
        "NAME;TYPE;VERSION"
        "HEADERS"
        ${ARGN}
    )
    
    # Get name.
    if(NOT PARSED_ARGS_NAME)
        message(FATAL_ERROR "No name provided")
    endif()
    set(NAME ${PARSED_ARGS_NAME} PARENT_SCOPE)
    
    # Get type.
    if(NOT PARSED_ARGS_TYPE)
        message(FATAL_ERROR "No target type provided")
    endif()
    set(VALID_TARGET_TYPES module)
    if(NOT PARSED_ARGS_TYPE IN_LIST VALID_TARGET_TYPES)
        message(FATAL_ERROR "Unknown target type ${PARSED_ARGS_TYPE}")
    endif()
    set(TYPE ${PARSED_ARGS_TYPE} PARENT_SCOPE)
    
    # Get version.
    if(NOT PARSED_ARGS_VERSION)
        message(STATUS "No version provided for ${PARSED_ARGS_NAME}, default to 1.0.0")
        set(VERSION "1.0.0" PARENT_SCOPE)
    else()
        set(VERSION ${PARSED_ARGS_VERSION} PARENT_SCOPE)
    endif()

    # Get headers.
    if(NOT PARSED_ARGS_HEADERS)
        set(HEADERS "" PARENT_SCOPE)
        set(HEADER_COUNT 0 PARENT_SCOPE)
    else()
        set(HEADERS "${PARSED_ARGS_HEADERS}" PARENT_SCOPE)
        list(LENGTH PARSED_ARGS_HEADERS HEADER_COUNT)
        set(HEADER_COUNT ${HEADER_COUNT} PARENT_SCOPE)
    endif()
    
endfunction()

function(install_target)
    # Utility function for installing targets.
    # 
    # NAME (value): Name of the target.
    # TYPE (value): Type of the target. Currently supported types are:
    #    module: Creates a library target.
    # VERSION (value): Version of the target.
    # HEADERS (list): List of header files.
    message(STATUS "start install_target()")
    list(APPEND CMAKE_MESSAGE_INDENT "  ")
    install_parse("${ARGV}")
    
    set(EXPORT_NAME "${NAME}Targets")

    install(
        TARGETS ${NAME}
        EXPORT ${EXPORT_NAME}
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION include
    )

    foreach (filename ${HEADERS})
        get_filename_component(dir ${filename} DIRECTORY)
        install(
            FILES ${filename}
            DESTINATION ${dir}
        )
    endforeach()
    
    if (NOT USE_CONAN)
        install(
            EXPORT ${EXPORT_NAME}
            FILE "${EXPORT_NAME}.cmake"
            NAMESPACE "${NAME}::"
            DESTINATION lib/cmake
        )

        include(CMakePackageConfigHelpers)

        write_basic_package_version_file(
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}ConfigVersion.cmake"
            VERSION ${VERSION}
            COMPATIBILITY SameMajorVersion
        )

        configure_package_config_file(
            ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/PackageConfigTemplate.cmake.in
            "${CMAKE_CURRENT_BINARY_DIR}/${NAME}Config.cmake"
            INSTALL_DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake
        )

        install(
            FILES
                "${CMAKE_CURRENT_BINARY_DIR}/${NAME}Config.cmake"
                "${CMAKE_CURRENT_BINARY_DIR}/${NAME}ConfigVersion.cmake"
            DESTINATION lib/cmake
        )
    endif()
    
    list(POP_BACK CMAKE_MESSAGE_INDENT)
    message(STATUS "end install_target()")
endfunction(install_target)