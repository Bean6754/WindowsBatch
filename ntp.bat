@echo off
color 02
title NTP Shell

REM This is an NTP shell for the Windows commandline.

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

REM Start w32time (w32tm) service.
net start w32time
REM Thank you, Cameron Oakenleaf - https://stackoverflow.com/a/14290557
@echo WScript.Echo DateDiff("s", "01/01/1970 00:00:00", Now()) > %temp%\epoch.vbs
cls

echo Available countries: 'de', 'fr', 'uk', 'us', 'no', 'se'.
echo Or 'help' for information on many more commands.
:retry
set "input="
set /p input="ntpsh>"

IF "%input%"=="exit" (
  del %temp%\epoch.vbs
  exit
) ELSE IF "%input%"=="help" (
  goto :help
) ELSE IF "%input%"=="clear" (
  goto :clear
) ELSE IF "%input%"=="cmd" (
  goto :cmd
) ELSE IF "%input%"=="ip" (
  goto :ip
) ELSE IF "%input%"=="ls" (
  goto :ls
) ELSE IF "%input%"=="motd" (
  goto :motd
) ELSE IF "%input%"=="netsh" (
  goto :netsh
) ELSE IF "%input%"=="powershell" (
  goto :powershell
) ELSE IF "%input%"=="reset" (
  goto :reset
) ELSE IF "%input%"=="servers" (
  goto :servers
) ELSE IF "%input%"=="sync" (
  goto :sync
) ELSE IF "%input%"=="time" (
  goto :time
) ELSE IF "%input%"=="" (
  goto :retry
) ELSE IF "%input%"=="de" (
  goto :de
) ELSE if "%input%"=="fr" (
  goto :fr
) ELSE IF "%input%"=="no" (
  goto :no
) ELSE IF "%input%"=="se" (
  goto :se
) ELSE IF "%input%"=="uk" (
  goto :uk
) ELSE IF "%input%"=="us" (
  goto :us
) ELSE (
  echo.
  echo Error 1: '%input%' is not a recognised command.
  echo.
  goto :retry
)

:help
echo 'clear' = Clear screen.
echo 'cmd' = Launch CMD.
echo 'exit' = Exit application.
echo 'help' = View more commands.
echo 'ip' = View ip address information (ipconfig).
echo 'ls' = List country codes and names.
echo 'netsh' = Launch netsh.
echo 'powershell' = Launch PowerShell.
echo 'reset' = Reset Windows NTP servers to defaults.
echo 'servers' = View NTP servers.
echo 'sync' = Sync local time with NTP server time (connects to set NTP servers).
echo 'time' = View localtime.
echo.
goto :retry

:clear
cls
goto :retry

:cmd
cmd
echo.
goto :retry

:ip
ipconfig /all
echo.
goto :retry

:ls
echo DE = Deutschland.
echo FR = France.
echo NO = Norge/Noreg.
echo SE = Sverige.
echo UK = United Kingdom.
echo US = United States.
echo.
goto :retry

:motd
echo Available countries: 'de', 'fr', 'uk', 'us', 'no', 'se'.
echo Or 'help' for information on many more commands.
echo What country are you from?
echo.
goto :retry

:netsh
netsh
echo.
goto :retry

:powershell
powershell
echo.
goto :retry

:reset
w32tm /config /update /manualpeerlist:"time.windows.com time.nist.gov"
echo Reset Windows NTP servers to the default servers.
echo.
goto :retry

:servers
w32tm /query /peers
echo.
goto :retry

:sync
w32tm /resync
echo.
goto :retry

:time
time /T
cscript /nologo %temp%\epoch.vbs
echo.
goto :retry

:de
w32tm /config /update /manualpeerlist:"0.de.pool.ntp.org 1.de.pool.ntp.org 2.de.pool.ntp.org 3.de.pool.ntp.org"
echo Done!
echo.
goto :retry

:fr
w32tm /config /update /manualpeerlist:"0.fr.pool.ntp.org 1.fr.pool.ntp.org 2.fr.pool.ntp.org 3.fr.pool.ntp.org"
echo Done!
echo.
goto :retry

:no
w32tm /config /update /manualpeerlist:"0.no.pool.ntp.org 1.no.pool.ntp.org 2.no.pool.ntp.org 3.no.pool.ntp.org"
echo Done!
echo.
goto :retry

:se
w32tm /config /update /manualpeerlist:"0.se.pool.ntp.org 1.se.pool.ntp.org 2.se.pool.ntp.org 3.se.pool.ntp.org"
echo Done!
echo.
goto :retry

:uk
w32tm /config /update /manualpeerlist:"0.uk.pool.ntp.org 1.uk.pool.ntp.org 2.uk.pool.ntp.org 3.uk.pool.ntp.org"
echo Done!
echo.
goto :retry

:us
w32tm /config /update /manualpeerlist:"0.us.pool.ntp.org 1.us.pool.ntp.org 2.us.pool.ntp.org 3.us.pool.ntp.org"
echo Done!
echo.
goto :retry
