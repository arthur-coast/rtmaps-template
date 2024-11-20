#!/bin/bash
# **********************************************************
#     2024 : Arthur JEULIN
#     Copyright (c) Coast Autonomous 
#     Created by Arthur JEULIN on 10/02/2024
# **********************************************************
#
# Module : Download a specific version of a PCK
#

# Path to RTMAPS_SDKDIR
RTMAPS_SDKDIR="/opt/rtmaps"

# Package name
PCK="coast_inventory"
VERSION="0.0.5.3"

# Generate the archive from the build script
"$RTMAPS_SDKDIR/bin/rtmaps_updater" get "pck_${PCK}" -minversion "$VERSION" -maxversion "$VERSION" -install

# Indicate success
echo "Success."

# Pause equivalent (wait for user input)
read -p "Press any key to continue..." -n1 -s