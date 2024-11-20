@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 10/02/2024
REM **********************************************************
REM
REM Module : Download a specific version of a pck
REM
REM Path to RTMAPS_SDKDIR
set RTMAPS_SDKDIR=C:\Program Files\Intempora\RTMaps 4

REM Package name
set PCK=coast_inventory
set VERSION=0.0.5.3

REM Generate the archive from the build_script
"%RTMAPS_SDKDIR%\bin\rtmaps_updater.exe" get "pck_%PCK%" -minversion "%VERSION%" -maxversion "%VERSION%" -install
