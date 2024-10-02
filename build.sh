#! /bin/bash
# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Coast Autonomous 
#      Created by Arthur JEULIN on 03/30/2024.
# **********************************************************
#
# Module : Build the project
#


# Obtient le chemin absolu du script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
VCPKG_DIR="$SCRIPT_DIR/vcpkg"
TOOLCHAIN_FILE="$VCPKG_DIR/scripts/buildsystems/vcpkg.cmake"

# Vérifier si le fichier toolchain existe
if [ ! -f "$TOOLCHAIN_FILE" ]; then
    echo "Toolchain file not found, running vcpkg install script..."
    sh "$SCRIPT_DIR/install_vcpkg.sh"
fi

if [ -d "build" ]; then
    # Le dossier build existe, le vider
    rm -rf build/*
else
    # Le dossier build n'existe pas, le créer
    mkdir build
fi

cmake --preset default
cmake --build --preset build-default
# Command to build the test
GTEST_COLOR=1 ctest --test-dir build --output-on-failure -- -j 12
sudo cmake --install build 