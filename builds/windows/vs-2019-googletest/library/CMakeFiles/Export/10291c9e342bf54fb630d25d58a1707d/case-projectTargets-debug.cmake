#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "case-project::case-project" for configuration "Debug"
set_property(TARGET case-project::case-project APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(case-project::case-project PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/case-projectd.lib"
  )

list(APPEND _cmake_import_check_targets case-project::case-project )
list(APPEND _cmake_import_check_files_for_case-project::case-project "${_IMPORT_PREFIX}/lib/case-projectd.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
