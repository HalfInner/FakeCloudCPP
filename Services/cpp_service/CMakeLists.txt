cmake_minimum_required(VERSION 3.25)

project("FakeCloudCPP-CPPService")

include(FetchContent)

# set(FETCHCONTENT_QUIET FALSE) # Needed to print downloading progress
# set(BOOST_INCLUDE_LIBRARIES system date_time)
# set(BOOST_ENABLE_CMAKE ON)
# FetchContent_Declare(
#     Boost
#     URL https://github.com/boostorg/boost/releases/download/boost-1.61.0/boost-1.81.0.7z
# )

FetchContent_Declare(
  crow
  GIT_REPOSITORY https://github.com/CrowCpp/Crow
  GIT_TAG        v1.0+5
)

# message(STATUS "Getting Boost")
# FetchContent_MakeAvailable(Boost)
# message(STATUS "Boost > src_dir=${boost_SOURCE_DIR}")
# include_directories(${boost_SOURCE_DIR})
# add_subdirectory(${depname_SOURCE_DIR} ${depname_BINARY_DIR})
# FetchContent_Populate(Boost)
# include_directories(${Boost_SOURCE_DIR})

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