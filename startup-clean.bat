@echo off
title Startup Cleaning Script
REM color 0e

cls
echo Stage 1: Temporary file location contents.
REM Temporary file location contents.
rmdir /s /q %tmp%\.
rmdir /s /q %windir%\Temp\.
rmdir /s /q %windir%\Logs\.

echo.
echo Stage 2: Windows Update.
REM Windows Update.
net stop bits
net stop cryptsvc
net stop wuauserv
rmdir /s /q %windir%\SoftwareDistribution\.
net start wuauserv

REM pause
exit
