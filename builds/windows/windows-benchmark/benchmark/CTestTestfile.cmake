# CMake generated Testfile for 
# Source directory: C:/Users/zero/cxx/case-project/benchmark
# Build directory: C:/Users/zero/cxx/case-project/builds/windows/windows-benchmark/benchmark
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(benchmark_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-benchmark/bin/Debug/benchmark_case-project.exe")
  set_tests_properties(benchmark_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(benchmark_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-benchmark/bin/Release/benchmark_case-project.exe")
  set_tests_properties(benchmark_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(benchmark_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-benchmark/bin/MinSizeRel/benchmark_case-project.exe")
  set_tests_properties(benchmark_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(benchmark_case-project "C:/Users/zero/cxx/case-project/builds/windows/windows-benchmark/bin/RelWithDebInfo/benchmark_case-project.exe")
  set_tests_properties(benchmark_case-project PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;15;add_test;C:/Users/zero/cxx/case-project/benchmark/CMakeLists.txt;0;")
else()
  add_test(benchmark_case-project NOT_AVAILABLE)
endif()
