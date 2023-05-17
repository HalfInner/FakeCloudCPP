@REM Bat
@echo off

set  BUILD_DIR="build_win"
@REM One can use raw cmake if has dependency installed
conan install . --output-folder=%BUILD_DIR% --build=missing


cmake -S . -B %BUILD_DIR% ^
    -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake 

cmake  --build %BUILD_DIR% -j7  --target ALL_BUILD --config Release
