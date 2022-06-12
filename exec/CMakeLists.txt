cmake_minimum_required(VERSION 3.16)

project(examples)

set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)

include_directories("../src")

add_executable(example1 ${CMAKE_CURRENT_SOURCE_DIR}/example1.cpp)
add_executable(example2 ${CMAKE_CURRENT_SOURCE_DIR}/example2.cpp)

add_library(print STATIC "../src/print.cpp")

target_link_libraries(example1 print)
target_link_libraries(example2 print)
