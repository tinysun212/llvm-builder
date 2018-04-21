rem build_script

rem Build clang
 c:/msys64/usr/bin/mkdir -p %WORK_DIR%/build/NinjaMinGW/llvm
 cd %WORK_DIR%/build/NinjaMinGW/llvm
 cmake -G Ninja -D CMAKE_BUILD_TYPE=RELEASE -DCMAKE_C_COMPILER=clang  -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_ASSERTIONS:BOOL=TRUE %WORK_DIR%/llvm
rem Use artifacts previously created by ninja
 SET JOB_NAME=Environment: PLATFORM=mingw64
 wget -q https://ci.appveyor.com/api/projects/tinysun212/llvm-prebuilder/artifacts/swift_llvm_cache.tar.gz?job="%JOB_NAME%"
 tar zxf swift_llvm_cache.tar.gz
 ninja
