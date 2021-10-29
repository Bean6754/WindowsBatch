@echo off
color 02
title Clear Print Spool

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

REM Message about net.exe and sc.exe.
cls
echo Note, if net doesn't work or freezes then replace with sc.
echo It is newer (Only works on NT, not DOS) but asynchronous, unlike net which is synchronous.
echo.

REM Program.
cd /d %SYSTEMDRIVE%\Windows\System32
net stop spoolsv
pushd C:\Windows\System32\spool\PRINTERS
del * . * /F /S /Q
popd
net start spoolsv

pause
exit
