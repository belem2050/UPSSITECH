cmake_minimum_required(VERSION 3.20)
project(agenda_cpp)

set(CMAKE_CXX_STANDARD 14)
include_directories(include)

file(GLOB src "src/*.cpp")

add_executable(agenda ${src})
