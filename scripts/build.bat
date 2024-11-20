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


:: Définir le répertoire du script (scripts/)
set "SCRIPT_DIR=%~dp0"

:: Définir le répertoire racine du projet (parent du dossier scripts)
set "PROJECT_DIR=%SCRIPT_DIR%\.."

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