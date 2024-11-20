@echo off
SETLOCAL
:: **********************************************************
::      2024 : Arthur JEULIN
::      Copyright (c) Coast Autonomous 
::      Created by Arthur JEULIN on 07/03/2024.
:: **********************************************************
::
:: Module : Install VCPKG Folder for Windows User
::

:: to run this script on windows
:: open powershell and run:
:: ./install_vcpkg.bat
::

:: Définir le répertoire du script (scripts/)
set "SCRIPT_DIR=%~dp0"

:: Définir le répertoire racine du projet (parent du dossier scripts)
set "PROJECT_DIR=%SCRIPT_DIR%\.."

set "VCPKG_DIR=%PROJECT_DIR%\vcpkg"

:: Clonage de vcpkg
echo Clonage de vcpkg...
git clone https://github.com/microsoft/vcpkg.git "%VCPKG_DIR%"
if %errorlevel% neq 0 (
    echo Échec du clonage de vcpkg.
    exit /b 1
)

:: Exécution de bootstrap-vcpkg.bat
echo Execution of bootstrap-vcpkg.bat...
cd /d "%VCPKG_DIR%"
call bootstrap-vcpkg.bat
if %errorlevel% neq 0 (
    echo Fail to intialize vcpkg.
    exit /b 1
)

echo vcpkg has been install and initiate with success.
ENDLOCAL