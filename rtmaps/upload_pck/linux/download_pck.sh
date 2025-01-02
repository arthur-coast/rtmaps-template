#!/bin/bash
# **********************************************************
#     2024 : Arthur JEULIN
#     Copyright (c) Coast Autonomous 
#     Created by Arthur JEULIN on 11/15/2024
# **********************************************************
#
# Module : Download a specific version of a PCK
#
# if you didn't add the upldate site to rtmaps
# to do 
# sudo ./rtmaps_updater configuration register ec2-3-12-34-146.us-east-2.compute.amazonaws.com
#
# Path to RTMAPS_SDKDIR
RTMAPS_SDKDIR="/opt/rtmaps"

# Package name
PCK="template"
VERSION="0.0.1"

# Generate the archive from the build script
"$RTMAPS_SDKDIR/bin/rtmaps_updater" get "pck_${PCK}" -minversion "$VERSION" -maxversion "$VERSION" -install

# Pause equivalent (wait for user input)
read -p "Press any key to continue..." -n1 -s