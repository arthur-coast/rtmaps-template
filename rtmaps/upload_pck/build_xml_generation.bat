@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 08/02/2024
REM     Created by Arthur JEULIN on 09/25/2024
REM **********************************************************
REM
REM Module : Generate RTMaps pck build.xml
REM
REM Path to RTMAPS_SDKDIR
set RTMAPS_SDKDIR=C:\Program Files\Intempora\RTMaps 4
REM Package name
set PCK=PCK_NAME

REM General the build script
"%RTMAPS_SDKDIR%\bin\rtmaps_updater.exe" build_script "%PCK%_build.xml" create -frompackage "%RTMAPS_SDKDIR%\user_sdk\packages\%PCK%\%PCK%.pck"

echo Success.
pause