rem after_build

 cd %WORK_DIR%/build/NinjaMinGW/llvm
 tar zcf swift_llvm_bin.tar.gz lib/*.a bin/clang.exe bin/clang++.exe bin/llvm-tblgen.exe cmake include lib/clang lib/cmake tools
 mv swift_llvm_bin.tar.gz %APPVEYOR_BUILD_FOLDER%
