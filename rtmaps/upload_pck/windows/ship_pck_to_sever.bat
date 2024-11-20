@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 10/02/2024
REM **********************************************************
REM
REM Module : Send the PCK archive to Deployement server
REM
REM Path to RTMAPS_SDKDIR
set RTMAPS_SDKDIR=C:\Program Files\Intempora\RTMaps 4
REM Package name
set PCK=coast_inventory
set VERSION=0.0.5.3

 :: Définition des chemins
set "KEY_PATH=C:\Users\arthu\Documents\aws-ec2-test-rtmaps-updater\arthur.pem"
set "FILE_PATH=%~dp0\rtmaps_pck_%PCK%_%VERSION%_windows_x86_64.zip"
set "DESTINATION=ubuntu@ec2-18-191-253-234.us-east-2.compute.amazonaws.com:/home/ubuntu/data/downloads/update_site_incoming/"

:: Exécution de la commande scp
scp -i "%KEY_PATH%" "%FILE_PATH%" "%DESTINATION%"

echo Success.