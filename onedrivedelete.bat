@echo off
mode 100
color f0
title OneDrive Deletion Tool v1.0 by Bean6754

goto check_Permissions
:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
	echo Now Exiting...
	PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
	exit
    )

    PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1

cd C:\
cls

echo Killing OneDrive process...
taskkill /f /im OneDrive.exe
echo Killed OneDrive process
echo.
PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
color f1
cls

echo Deleting OneDrive from system32...
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
echo Deleted OneDrive from system32
echo.
PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
color f2

echo Deleting OneDrive from SysWOW64...
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
echo Deleted OneDrive from SysWOW64
echo.
PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
color f3


echo Finished!

pause
exit