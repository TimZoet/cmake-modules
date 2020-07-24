set(NAME example_lib)
set(TYPE module)
set(INCLUDE_DIR "include/example_lib")
set(SRC_DIR "src")

set(HEADERS
	${INCLUDE_DIR}/code.h
)
 
set(SOURCES
	${SRC_DIR}/code.cpp
)

make_target(NAME ${NAME} TYPE ${TYPE} EXAMPLE HEADERS "${HEADERS}" SOURCES "${SOURCES}")