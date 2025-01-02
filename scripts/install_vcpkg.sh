#! /bin/bash
# **********************************************************
#      2024 : Arthur JEULIN
#      Copyright (c) Coast Autonomous 
#      Created by Arthur JEULIN on 10/20/2024.
# **********************************************************
#
# Module : Install VCPKG Folder for Linux User
#

# to run this script on windows
# open wsl terminal and go to cd /mnt/c/dev/rtmaps/coast_tools
# ./install_vcpkg.sh
#
# CAUTION: THE FILE HAS TO BE LF AND NOTE CRLF
#
#!/bin/bash

# Check the machine's architecture
ARCH=$(uname -m)

if [[ "$ARCH" == "arm"* || "$ARCH" == "aarch64" ]]; then
    echo "ARM architecture detected: $ARCH"
    export VCPKG_FORCE_SYSTEM_BINARIES=1
    echo "Environment variable VCPKG_FORCE_SYSTEM_BINARIES set to 1"
else
    echo "Non-ARM architecture detected: $ARCH"
fi

git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh