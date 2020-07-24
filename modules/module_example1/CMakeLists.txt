set(NAME module_example1)
set(TYPE module)
set(INCLUDE_DIR "include/module_example1")
set(SRC_DIR "src")

set(HEADERS
	${INCLUDE_DIR}/code.h
)
 
set(SOURCES
	${SRC_DIR}/code.cpp
)

set(DEPS_PRIVATE
	module_example2
)

make_target(NAME ${NAME} TYPE ${TYPE} HEADERS "${HEADERS}" SOURCES "${SOURCES}" DEPS_PRIVATE "${DEPS_PRIVATE}")