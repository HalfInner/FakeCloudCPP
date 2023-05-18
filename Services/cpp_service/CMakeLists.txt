cmake_minimum_required(VERSION 3.25)

project(FakeCloudCPP-CPPService)

include(FetchCrow.cmake)

set (C_STANDARD_REQUIRED 20)
set (CXX_STANDARD_REQUIRED 20)

set (SOURCES 
   src/main.cc
)
message(STATUS "Build for ${CMAKE_SYSTEM}")

# use conditional operations instead of 'if' branches
if(CMAKE_SYSTEM MATCHES Windows)
   set(COMMON_FLAGS "")
endif()

if(CMAKE_HOST_SYSTEM MATCHES Linux)
   set(COMMON_FLAGS "-v -pthread -Wpedantic -Werror -Werror=return-type")
   # -fsanitize=address -fsanitize=undefined  
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_FLAGS}")

add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE Crow)
target_link_libraries(${PROJECT_NAME} PRIVATE Crow)
# target_compile_options(${PROJECT_NAME} -fno-sanitize=all)