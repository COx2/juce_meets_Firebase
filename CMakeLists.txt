cmake_minimum_required(VERSION 3.15)

set(CMAKE_OSX_DEPLOYMENT_TARGET "10.11" CACHE STRING "osx deployment target")
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

# Windows runtime mode, either MD or MT depending on whether you are using
# /MD or /MT. For more information see:
# https://msdn.microsoft.com/en-us/library/2kzt1wy3.aspx
set(MSVC_RUNTIME_MODE MT)

# Set project name used as solution name 
project(juce_meets_Firebase VERSION 0.1.7)

# If you've put JUCE in a subdirectory called JUCE
add_subdirectory(External/JUCE)

# Add Firebase libraries to the target using the function from the SDK.
add_subdirectory(External/firebase_cpp_sdk bin/ EXCLUDE_FROM_ALL)

# Include sub projects
include(./Examples/AuthTest/AuthTest.cmake)
