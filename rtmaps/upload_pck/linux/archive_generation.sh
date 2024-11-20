#!/bin/bash
# **********************************************************
#     2024 : Arthur JEULIN
#     Copyright (c) Coast Autonomous 
#     Created by Arthur JEULIN on 10/02/2024
# **********************************************************
#
# Module : Generate RTMaps pck archive to upload on 
#           rtmaps_uploader_site
#

# Path to RTMAPS_SDKDIR
RTMAPS_SDKDIR="/opt/rtmaps"

# Package name
PCK="coast_inventory"

# Generate the archive from the build script
"$RTMAPS_SDKDIR/bin/rtmaps_updater" build_script "${PCK}_build.xml" execute

# Indicate success
echo "Success."

# Pause equivalent (wait for user input)
read -p "Press any key to continue..." -n1 -s
