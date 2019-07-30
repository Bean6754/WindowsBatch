@echo off
color 02
title Windows Repair Utility (Unofficial)

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

echo Type 'help' for information on commands.
:retry
set "input="
set /p input="RepairUtil>"

IF "%input%"=="exit" (
  exit
) ELSE IF "%input%"=="cls" (
  goto :cls
) ELSE IF "%input%"=="" (
  goto :retry
) ELSE IF "%input%"=="help" (
  goto :help
) ELSE IF "%input%"=="sfc" (
  goto :sfc
) ELSE IF "%input%"=="dism" (
  goto :dism
) ELSE (
  echo.
  echo Error 1: '%input%' is not a recognised command.
  echo.
  goto :retry
)
  
  
:cls
cls
goto :retry

:help
echo SFC - Runs System File Checker.
echo DISM - Runs through DISM cleaning process.
echo.
goto :retry

:sfc
sfc /scannow
goto :retry

:dism
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
goto :retry
