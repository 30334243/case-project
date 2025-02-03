#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mongo::bson_shared" for configuration "Debug"
set_property(TARGET mongo::bson_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mongo::bson_shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/bson-1.0d.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/bson-1.0d.dll"
  )

list(APPEND _cmake_import_check_targets mongo::bson_shared )
list(APPEND _cmake_import_check_files_for_mongo::bson_shared "${_IMPORT_PREFIX}/lib/bson-1.0d.lib" "${_IMPORT_PREFIX}/bin/bson-1.0d.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
