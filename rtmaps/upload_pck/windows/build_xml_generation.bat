@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 10/02/2024
REM **********************************************************
REM
REM Module : Generate RTMaps PCK_build.xml use for archive_generation.bat
REM
REM Path to RTMAPS_SDKDIR
set RTMAPS_SDKDIR=C:\Program Files\Intempora\RTMaps 4
REM Package name
set PCK=coast_inventory

REM General the build script
"%RTMAPS_SDKDIR%\bin\rtmaps_updater.exe" build_script "%PCK%_build.xml" create -frompackage "%RTMAPS_SDKDIR%\user_sdk\packages\%PCK%\%PCK%.pck"

echo Success.
pause