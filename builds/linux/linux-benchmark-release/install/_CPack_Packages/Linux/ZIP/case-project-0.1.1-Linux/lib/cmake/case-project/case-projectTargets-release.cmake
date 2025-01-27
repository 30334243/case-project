#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "case-project::case-project" for configuration "Release"
set_property(TARGET case-project::case-project APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(case-project::case-project PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libcase-project.a"
  )

list(APPEND _cmake_import_check_targets case-project::case-project )
list(APPEND _cmake_import_check_files_for_case-project::case-project "${_IMPORT_PREFIX}/lib/libcase-project.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
