function(file_to_source_group name a b)
	# Replace backward slashes by forward slashes.
	string(REGEX REPLACE "\\\\" "\/" fixedname ${name})
	
	# Get relative path.
	if (IS_ABSOLUTE ${fixedname})
		file(RELATIVE_PATH relativename ${CMAKE_SOURCE_DIR} ${fixedname})
	else()
		set(relativename ${fixedname})
	endif()

	# Split into directories and filename.
	get_filename_component(dir ${relativename} DIRECTORY)
	get_filename_component(filename ${relativename} NAME)
	
	# Replace a by b.
	string(REGEX REPLACE ${a} ${b} src_grp ${dir})
	
	string(REGEX REPLACE "\/" "\\\\" src_grp2 ${src_grp})

	# Add to source group.
	source_group(${src_grp2} FILES ${name})
endfunction()

function(make_source_groups name headers sources)
	foreach(filename ${headers})
		file_to_source_group(${filename} "^include\/${name}" "include")
	endforeach()
	
	foreach(filename ${sources})
		file_to_source_group(${filename} "^src" "src")
	endforeach()
endfunction()