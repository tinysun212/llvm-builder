rem build_script

rem Build clang
 MKDIR %WORK_DIR%\build\Ninja-ReleaseAssert\llvm-cygwin-x86_64
 CD %WORK_DIR%/build/Ninja-ReleaseAssert/llvm-cygwin-x86_64
 SET WORK_DIR_IN_CYGWIN=/cygdrive/c/projects
 cmake -G Ninja -DCMAKE_C_COMPILER:PATH=/usr/bin/clang -DCMAKE_CXX_COMPILER:PATH=/usr/bin/clang++ -DLLVM_VERSION_MAJOR:STRING=4  ^
    -DLLVM_VERSION_MINOR:STRING=0 -DLLVM_VERSION_PATCH:STRING=0 -DCLANG_VERSION_MAJOR:STRING=4 -DCLANG_VERSION_MINOR:STRING=0    ^
    -DCLANG_VERSION_PATCH:STRING=0 -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja -DLLVM_ENABLE_ASSERTIONS=TRUE                             ^
    '-DLLVM_TARGETS_TO_BUILD=X86;ARM;AArch64;PowerPC;SystemZ' -DCMAKE_LIBTOOL:PATH=/usr/bin/libtool                              ^
    '-DCMAKE_C_FLAGS=  -Wno-unknown-warning-option -Werror=unguarded-availability-new -fno-stack-protector'                      ^
    '-DCMAKE_CXX_FLAGS=  -Wno-unknown-warning-option -Werror=unguarded-availability-new -fno-stack-protector'                    ^
    '-DCMAKE_C_FLAGS_RELWITHDEBINFO=-O2 -DNDEBUG' '-DCMAKE_CXX_FLAGS_RELWITHDEBINFO=-O2 -DNDEBUG' -DCMAKE_BUILD_TYPE:STRING=Release   ^
    -DLLVM_TOOL_SWIFT_BUILD:BOOL=NO -DLLVM_INCLUDE_DOCS:BOOL=TRUE -DLLVM_ENABLE_LTO:STRING= -DLLVM_TOOL_COMPILER_RT_BUILD:BOOL=TRUE   ^
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=TRUE -DLLVM_LIT_ARGS=-sv -DCMAKE_INSTALL_PREFIX:PATH=/usr/ -DINTERNAL_INSTALL_PREFIX=local ^
    %WORK_DIR_IN_CYGWIN%/llvm
rem Use artifacts previously created by ninja
 SET JOB_NAME=Environment: PLATFORM=mingw64
 wget -q https://ci.appveyor.com/api/projects/tinysun212/llvm-prebuilder/artifacts/swift_llvm_cache.tar.gz?job="%JOB_NAME%"
 tar zxf swift_llvm_cache.tar.gz
 ninja
