#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mongo::mongoc_static" for configuration "Debug"
set_property(TARGET mongo::mongoc_static APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mongo::mongoc_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/mongoc-static-1.0d.lib"
  )

list(APPEND _cmake_import_check_targets mongo::mongoc_static )
list(APPEND _cmake_import_check_files_for_mongo::mongoc_static "${_IMPORT_PREFIX}/lib/mongoc-static-1.0d.lib" )

# Import target "mongo::mongoc_shared" for configuration "Debug"
set_property(TARGET mongo::mongoc_shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mongo::mongoc_shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/mongoc-1.0d.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/mongoc-1.0d.dll"
  )

list(APPEND _cmake_import_check_targets mongo::mongoc_shared )
list(APPEND _cmake_import_check_files_for_mongo::mongoc_shared "${_IMPORT_PREFIX}/lib/mongoc-1.0d.lib" "${_IMPORT_PREFIX}/bin/mongoc-1.0d.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
