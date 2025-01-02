#!/bin/bash
# **********************************************************
#     2024 : Arthur JEULIN
#     Copyright (c) Coast Autonomous 
#     Created by Arthur JEULIN on 11/15/2024
# **********************************************************
#
# Module : Generate RTMaps PCK_build.xml use for archive_generation.sh
#

# Path to RTMAPS_SDKDIR
RTMAPS_SDKDIR="/opt/rtmaps"
PROJECT_DIR="/ssd/template/build/release/rtmaps"
# Package name
PCK="template"

# Generate the build script
"$RTMAPS_SDKDIR/bin/rtmaps_updater" build_script "${PCK}_build.xml" create -frompackage "$PROJECT_DIR/$PCK.pck"

# Pause equivalent (wait for user input)
read -p "Press any key to continue..." -n1 -s