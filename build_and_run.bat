@REM Bat
@echo off

set  "BUILD_DIR"="build_win"
@REM One can use raw cmake if has dependency installed
conan install . --output-folder=%BUILD_DIR% --build=missing

cd %BUILD_DIR%
cmake ..
-DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake \
-DCMAKE_BUILD_TYPE=Release \
cmake  --build  . -j8
