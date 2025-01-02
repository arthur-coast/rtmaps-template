#!/bin/bash
# **********************************************************
#     2024 : Arthur JEULIN
#     Copyright (c) Coast Autonomous 
#     Created by Arthur JEULIN on 11/15/2024
# **********************************************************
#
# Module : Send the PCK archive to Deployment server
#

# Package name
PCK="template"
VERSION="0.0.1"

# Define paths
KEY_PATH="/ssd/ssh/dev.pem"
FILE_PATH="$(dirname "$0")/rtmaps_pck_${PCK}_${VERSION}_ubuntu2004_armv8.zip"
DESTINATION="dev@ec2-3-12-34-146.us-east-2.compute.amazonaws.com:/home/dev/data/downloads/update_site_incoming/"

# Execute scp command
scp -i "$KEY_PATH" "$FILE_PATH" "$DESTINATION"


# Pause equivalent (wait for user input)
read -p "Press any key to continue..." -n1 -s