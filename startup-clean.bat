@echo off
title Startup Cleaning Script
REM color 0e

REM This script requires Admin-rights to run so it is advised to either run as SYSTEM before login or create a UAC exception.

REM cd into directories to rmdir /s /q says 'file is in use by another process' so it keeps the folder but deletes all files and folders inside of it.
REM `&&` executes this command only if previous command's errorlevel is 0.

cls
echo Stage 1: Temporary file location contents.
REM Temporary file location contents.
cd %tmp% && rmdir /s /q %tmp%\.
cd %windir%\Temp && rmdir /s /q %windir%\Temp\.
cd %windir%\Logs && rmdir /s /q %windir%\Logs\.
echo Stage 1 complete.

echo.
echo Stage 2: Windows Update.
REM Windows Update.
net stop bits
net stop cryptsvc
net stop wuauserv
cd %windir%\SoftwareDistribution && rmdir /s /q %windir%\SoftwareDistribution\.
net start wuauserv
echo Stage 2 complete.

REM pause
exit
