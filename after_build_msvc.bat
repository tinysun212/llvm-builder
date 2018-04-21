rem after_build

 7z a -so -ttar -r dummy bin/clang.exe bin/clang++.exe bin/llvm-tblgen.exe lib/*.lib lib/clang lib/cmake cmake include tools | 7z a -si -tgzip -bd -bso0 swift_llvm_bin.tar.gz
 MOVE swift_llvm_bin.tar.gz %APPVEYOR_BUILD_FOLDER%
