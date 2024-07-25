@echo off
REM **********************************************************
REM     2024 : Arthur JEULIN
REM     Copyright (c) Coast Autonomous 
REM     Created by Arthur JEULIN on 03/30/2024.
REM     Edited by Arthur JEULIN on 07/22/2024.
REM **********************************************************
REM
REM Module : Run the unit tests 
REM

REM to run this script on windows, just double-click run_tests.bat or run it from cmd

REM Chemin vers le dossier de tests
set "TEST_DIR=..\build\bin\test\Release"

REM Dossier pour stocker les rapports de test
set "REPORT_DIR=.\test_reports"
if not exist "%REPORT_DIR%" mkdir "%REPORT_DIR%"

REM Vérifiez si le dossier existe
if exist "%TEST_DIR%" (
    REM Naviguer au dossier de tests
    cd /d "%TEST_DIR%"

    REM Exécuter tous les fichiers exécutables de tests et générer des rapports XML
    for %%X in (*.exe) do (
        if exist "%%X" (
            REM echo Exécution de %%X
            "%%X" --gtest_output="xml:%REPORT_DIR%\%%~nX.xml"
        )
    )
) else (
    echo Dossier %TEST_DIR% non trouvé.
)

@REM cd %~dp0  @REM Retour au dossier où se trouve run_tests.bat
cd "C:\dev\rtmaps\coast-inventory\test"  
python3 .\analysis_tests.py