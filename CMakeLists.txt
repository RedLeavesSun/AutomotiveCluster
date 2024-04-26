cmake_minimum_required(VERSION 3.16)

project(cluster-2d VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup()

include_directories(cpp/headers)

file(GLOB_RECURSE SRC_FILES cpp/*)

file(GLOB_RECURSE QRC_FILES *.qrc)

qt_add_executable(cluster-2d ${SRC_FILES} ${QRC_FILES})

target_link_libraries(cluster-2d PRIVATE Qt6::Core Qt6::Quick)

add_subdirectory(imageformats)
