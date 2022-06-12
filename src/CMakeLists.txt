cmake_minimum_required(VERSION 3.16)

project(print)

set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)

add_library(print STATIC ${CMAKE_CURRENT_SOURCE_DIR}/print.cpp)
