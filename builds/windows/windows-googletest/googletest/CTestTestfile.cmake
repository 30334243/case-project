# CMake generated Testfile for 
# Source directory: C:/Users/zero/cxx/case-project/googletest
# Build directory: C:/Users/zero/cxx/case-project/builds/windows/windows-googletest/googletest
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(googletest_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-googletest/bin/Debug/googletest_case-project.exe")
  set_tests_properties(googletest_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(googletest_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-googletest/bin/Release/googletest_case-project.exe")
  set_tests_properties(googletest_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(googletest_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-googletest/bin/MinSizeRel/googletest_case-project.exe")
  set_tests_properties(googletest_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(googletest_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-googletest/bin/RelWithDebInfo/googletest_case-project.exe")
  set_tests_properties(googletest_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/googletest/CMakeLists.txt;0;")
else()
  add_test(googletest_case-project NOT_AVAILABLE)
endif()
