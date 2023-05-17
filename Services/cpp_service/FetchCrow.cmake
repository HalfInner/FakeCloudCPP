
include(FetchContent)
set(FETCHCONTENT_QUIET FALSE)

FetchContent_Declare(
  Crow
  GIT_REPOSITORY https://github.com/CrowCpp/Crow.git
  GIT_TAG        v1.0+5
)

FetchContent_MakeAvailable(Crow)
# FetchContent_GetProperties(Crow)
# if(NOT Crow_POPULATED)
#   # Fetch the content using previously declared details
#   FetchContent_Populate(Crow)

#   # Set custom variables, policies, etc.
#   # ...

#   # Bring the populated content into the build
#   message(STATUS "Crow details [${Crow_SOURCE_DIR}; ${Crow_BINARY_DIR}]")
#   add_subdirectory(${Crow_SOURCE_DIR} ${Crow_BINARY_DIR})
# endif()