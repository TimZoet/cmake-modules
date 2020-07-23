set(NAME module_example2)
set(TYPE module)
set(INCLUDE_DIR "include/module_example2")
set(SRC_DIR "src")
set(FOLDER "modules/subfolder")

set(HEADERS
	${INCLUDE_DIR}/header.h
)
 
set(SOURCES
	${SRC_DIR}/source.cpp
)

make_target(NAME ${NAME} TYPE ${TYPE} FOLDER ${FOLDER} HEADERS "${HEADERS}" SOURCES "${SOURCES}")