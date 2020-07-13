@echo off
mode 100
color f0
title Hosts v1.0 by Bean6754

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

cd %SystemRoot%\System32\drivers\etc
cls

echo: >> hosts
echo # GitHub: https://github.com/Bean6754 >> hosts
echo 0.0.0.0 bing.com >> hosts
echo 0.0.0.0 microsoft.com >> hosts
echo 0.0.0.0 onedrive.com >> hosts
echo 0.0.0.0 onedrive.live.com >> hosts
echo 0.0.0.0 microsoftstore.com >> hosts
echo # end >> hosts
echo: >> hosts

exit
