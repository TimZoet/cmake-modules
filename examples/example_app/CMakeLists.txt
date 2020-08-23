set(NAME example_app)
set(TYPE application)
set(INCLUDE_DIR "include/example_app")
set(SRC_DIR "src")

set(HEADERS
	${INCLUDE_DIR}/header.h
)
 
set(SOURCES
	${SRC_DIR}/main.cpp
)

set(DEPS_PRIVATE
	example_lib
	example_lib_with_pkg
)

make_target(NAME ${NAME} TYPE ${TYPE} EXAMPLE HEADERS "${HEADERS}" SOURCES "${SOURCES}" DEPS_PRIVATE "${DEPS_PRIVATE}")