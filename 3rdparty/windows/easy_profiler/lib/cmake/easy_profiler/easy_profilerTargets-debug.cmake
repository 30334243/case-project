#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "easy_profiler" for configuration "Debug"
set_property(TARGET easy_profiler APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(easy_profiler PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/lib/easy_profilerd.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/bin/easy_profilerd.dll"
  )

list(APPEND _cmake_import_check_targets easy_profiler )
list(APPEND _cmake_import_check_files_for_easy_profiler "${_IMPORT_PREFIX}/lib/easy_profilerd.lib" "${_IMPORT_PREFIX}/bin/easy_profilerd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
