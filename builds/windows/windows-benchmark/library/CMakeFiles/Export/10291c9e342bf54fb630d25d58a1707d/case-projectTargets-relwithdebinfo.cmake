#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "case-project::case-project" for configuration "RelWithDebInfo"
set_property(TARGET case-project::case-project APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(case-project::case-project PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/case-project.lib"
  )

list(APPEND _cmake_import_check_targets case-project::case-project )
list(APPEND _cmake_import_check_files_for_case-project::case-project "${_IMPORT_PREFIX}/lib/case-project.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
