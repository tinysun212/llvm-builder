rem build_script

rem Build clang
 MKDIR %WORK_DIR%\build\NinjaMSVC\llvm
 CD %WORK_DIR%/build/NinjaMSVC/llvm
 CALL "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
 cmake -G "Ninja" -DCMAKE_C_COMPILER=clang-cl -DCMAKE_CXX_COMPILER=clang-cl -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_CXX_FLAGS="-DLLVM_ENABLE_DUMP" ..\..\..\llvm
rem Use artifacts previously created by ninja
 SET JOB_NAME=Environment: PLATFORM=msvc
 wget -q https://ci.appveyor.com/api/projects/tinysun212/llvm-prebuilder/artifacts/swift_llvm_cache.tar.gz?job="%JOB_NAME%"
 7z x swift_llvm_cache.tar.gz -bd -bso0
 7z x swift_llvm_cache.tar -aoa -bd -bso0
 ninja
