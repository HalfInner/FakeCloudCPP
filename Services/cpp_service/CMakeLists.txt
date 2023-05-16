cmake_minimum_required(VERSION 3.25)

project("FakeCloudCPP-CPPService")

include(FetchContent)
set(FETCHCONTENT_QUIET FALSE)

set(Boost_INCLUDE_DIR "${CMAKE_BINARY_DIR}/_deps/boost-src")

find_package(Boost REQUIRED)
if(Boost_FOUND)
   message(STATUS "FOUND")
   include_directories(${Boost_INCLUDE_DIRS})
else() 
   message(STATUS "WTF?")
endif()

message(STATUS "Getting crow")
set(CROW_INSTALL FALSE)
FetchContent_MakeAvailable(crow)


set (C_STANDARD_REQUIRED 20)
set (CXX_STANDARD_REQUIRED 20)

set (SOURCES 
   src/main.cc
)
message(STATUS "Build for ${CMAKE_SYSTEM}")

if(CMAKE_SYSTEM MATCHES Windows)
   set(COMMON_FLAGS "")
endif()

if(CMAKE_HOST_SYSTEM MATCHES Linux)
   set(COMMON_FLAGS "-v -pthread -Wpedantic -Werror -fsanitize=address -fsanitize=undefined  -Werror=return-type")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMMON_FLAGS}")

add_executable(${PROJECT_NAME} ${SOURCES})
target_link_libraries(${PROJECT_NAME} PRIVATE Crow::Crow)
# target_include_directories(${PROJECT_NAME} PRIVATE Boost::config)