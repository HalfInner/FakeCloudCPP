#! /usr/bin/env sh
 
BUILD_DIR="build"
# One can use raw cmake if has dependency installed
conan install . --output-folder=${BUILD_DIR} --build=missing \
&& cmake -S . -B ${BUILD_DIR} \
    -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake \
    -DCMAKE_BUILD_TYPE=Release \
&& cmake  --build  ${BUILD_DIR} -j8
