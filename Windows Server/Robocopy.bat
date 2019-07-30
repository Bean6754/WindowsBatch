@echo off
title Robocopy - Robust File Copy
color 02


REM Datestamp and Timestamp code.
for /f "tokens=*" %%i in ('date /t') do (
set _datestamp=%%i
)
for /f "tokens=*" %%j in ('time /t') do (
set _timestamp=%%j
)

set datestamp2=%_datestamp:/=-%
set datestamp=%datestamp2: =_%
set timestamp2=%_timestamp::=-%
set timestamp=%timestamp2: =_%

REM Example date output: 05-06-2019_11-33_AM
REM ----------------

mkdir "F:\www_backup-%datestamp%%timestamp%"
robocopy.exe C:\xampp\htdocs F:\www_backup-%datestamp%%timestamp%\ /COPYALL /MIR /W:1 /R:1 /LOG:"F:\www_backup\robocopy_log-%datestamp%%timestamp%.txt"
attrib -S -H -R "F:\www_backup-%datestamp%%timestamp%"

REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy
REM /W = /WAIT:seconds (default = 30 seconds)
REM /R = /RETRIES:num (default = 1 million)
REM /MIR = /PURGE /E
REM /COPYALL = Copies all file information (equivalent to /copy:DATSOU).
REM /SEC = Copies files with security (equivalent to /copy:DATS).
REM D Data
REM A Attributes
REM T Time stamps
REM S NTFS access control list (ACL)
REM O Owner information
REM U Auditing information

pause
exit
