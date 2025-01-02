#! /bin/bash
# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Coast Autonomous 
#      Created by Arthur JEULIN on 10/20/2024.
# **********************************************************
#
# Module : Build the project
#

# Move back to project root
cd "$(dirname "$0")/.."

if [ -d "build" ]; then
    # Le dossier build existe, le vider
    rm -rf build/*
else
    # Le dossier build n'existe pas, le créer
    mkdir build
fi

cmake --preset config-release
cmake --build --preset build-release
# Command to build the test
#GTEST_COLOR=1 ctest --test-dir build --output-on-failure -- -j 12
#cmake --install build 