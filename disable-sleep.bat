@echo off

color 02
title Disable Automatic Sleep on Power

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

REM AC = on-power and DC = on-battery.
cd %windir%\System32
powercfg.exe /change standby-timeout-ac 0
