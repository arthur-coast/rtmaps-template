# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Coast Autonomous 
#      Created by Arthur JEULIN on 03/30/2024.
# **********************************************************

cmake_minimum_required(VERSION 3.27.5)

set(POSITION_INDEPENDENT_CODE ON)

enable_testing()
find_package(GTest CONFIG REQUIRED)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/test)
# Include GoogleTest and enable testing

# include(GoogleTest)
# Find all test cpp files in the tests directory
file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/units/*.cpp")

foreach(test_source ${TEST_SOURCES})
    # Get a human readable name
    get_filename_component(test_name ${test_source} NAME_WE)

    # Add executable for this test
    add_executable(${test_name} ${test_source})

    # Include directories
    target_include_directories(${test_name} PRIVATE ${CMAKE_SOURCE_DIR}/include)

    # Link libraries
    target_link_libraries(${test_name} PRIVATE 
        my_library        # Library we are testing
        GTest::gtest_main 
        GTest::gmock_main
    )

    # Discover tests
    # gtest_discover_tests(${test_name})
    add_test(AllTestsInMain ${test_name})
    endforeach()

if(BUILD_TESTING)
  Message("BUILD_TESTING ON")
endif()

