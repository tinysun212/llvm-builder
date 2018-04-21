rem after_build

 CD %WORK_DIR%/build/Ninja-ReleaseAssert/llvm-cygwin-x86_64
 tar zcf swift_llvm_bin.tar.gz lib/*.a bin/clang-4.0.exe bin/clang.exe bin/clang++.exe bin/llvm-tblgen.exe cmake include lib/clang lib/cmake tools
 MOVE swift_llvm_bin.tar.gz %APPVEYOR_BUILD_FOLDER%
