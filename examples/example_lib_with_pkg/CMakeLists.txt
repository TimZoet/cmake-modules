find_package(nlohmann_json REQUIRED)

set(NAME example_lib_with_pkg)
set(TYPE module)
set(INCLUDE_DIR "include/example_lib_with_pkg")
set(SRC_DIR "src")

set(HEADERS
	${INCLUDE_DIR}/code.h
)
 
set(SOURCES
	${SRC_DIR}/code.cpp
)

set(DEPS_PRIVATE
	nlohmann_json::nlohmann_json
)

make_target(NAME ${NAME} TYPE ${TYPE} EXAMPLE HEADERS "${HEADERS}" SOURCES "${SOURCES}" DEPS_PRIVATE "${DEPS_PRIVATE}")