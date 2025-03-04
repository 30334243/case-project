#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mongo::bsoncxx_shared" for configuration "Debug"
set_property(TARGET mongo::bsoncxx_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mongo::bsoncxx_shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/bsoncxx-v_noabi-dhi-x64-v142-mddd.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "mongo::bson_shared"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/bsoncxx-v_noabi-dhi-x64-v142-mddd.dll"
  )

list(APPEND _cmake_import_check_targets mongo::bsoncxx_shared )
list(APPEND _cmake_import_check_files_for_mongo::bsoncxx_shared "${_IMPORT_PREFIX}/lib/bsoncxx-v_noabi-dhi-x64-v142-mddd.lib" "${_IMPORT_PREFIX}/bin/bsoncxx-v_noabi-dhi-x64-v142-mddd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
