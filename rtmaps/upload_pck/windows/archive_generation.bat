@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 10/02/2024
REM **********************************************************
REM
REM Module : Generate RTMaps pck archive to upload on 
REM           rtmaps_uploader_site
REM
REM Path to RTMAPS_SDKDIR
set RTMAPS_SDKDIR=C:\Program Files\Intempora\RTMaps 4
setlocal 
REM Package name
set PCK=coast_inventory

REM Generate the archive from the build_script
"%RTMAPS_SDKDIR%\bin\rtmaps_updater.exe" build_script "%PCK%_build.xml" execute

endlocal
echo Success.
pause