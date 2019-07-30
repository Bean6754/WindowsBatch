@echo off
color 04
title Npcap Fix Driver

REM This fixes nmap by uninstalling the 'monitor mode' driver and installing the default driver.

goto check_Permissions
:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        REM echo Success: Administrative permissions confirmed.
    ) else (
        color 04
        echo Failure: Current permissions inadequate.
	echo Now Exiting...
	PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
	exit
    )

cd /d "%SystemDrive%\Program Files\Npcap"
NPFInstall.exe -u2
NPFInstall.exe -u
NPFInstall.exe -i
