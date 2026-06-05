@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

if not exist "main.py" (
    echo This launcher is intended to be used inside an extracted JASSCO release ZIP.
    echo Download and extract the latest package from the Software folder or GitHub Releases.
    exit /b 1
)

set "INPUT_FILE=%~1"
set "OUTPUT_FILE=%~2"

if "%INPUT_FILE%"=="" set "INPUT_FILE=input.js"
if "%OUTPUT_FILE%"=="" set "OUTPUT_FILE=output.asm"

where py >nul 2>nul
if not errorlevel 1 (
    py -3 "main.py" "%INPUT_FILE%" "%OUTPUT_FILE%"
    exit /b %errorlevel%
)

python "main.py" "%INPUT_FILE%" "%OUTPUT_FILE%"
