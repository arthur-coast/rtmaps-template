@echo off
setlocal
:: **********************************************************
::      2024 : Arthur JEULIN
::      Copyright (c) Coast Autonomous 
::      Created by Arthur JEULIN on 09/04/2024.
:: **********************************************************
::
:: Module : Build project
::
:: Définir les chemins

:: Get the current directory of the batch file, which is assumed to be the project root
set "PROJECT_DIR=%~dp0"

:: Remove the trailing backslash
set "SOURCE_DIR=%PROJECT_DIR:~0,-1%"

:: Specify the build directory
set "BUILD_DIR=%SOURCE_DIR%\build"


set "VCPKG_DIR=%SOURCE_DIR%\vcpkg"

:: Créer le répertoire de build si nécessaire
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

:: Configuration du projet
cmake --preset x64-windows

:: Construction du projet
cmake --build --preset build-windows --target install

echo Build completed.
pause

endlocal
