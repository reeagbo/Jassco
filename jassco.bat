@echo off
cd python

REM Set default values if no parameters are provided
set INPUT_FILE=%1
set OUTPUT_FILE=%2

if "%1"=="" set INPUT_FILE=input.js
if "%2"=="" set OUTPUT_FILE=output.asm

python main.py ..\%INPUT_FILE% ..\%OUTPUT_FILE%
cd ..

.\pasmo\pasmo.exe --tap %OUTPUT_FILE% output.tap
"c:\Program Files (x86)\Fuse\fuse.exe" output.tap



