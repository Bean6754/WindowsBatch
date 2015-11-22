@echo off
mode 100
color f0
title SC Privacy Deletion Service v1.0 by Bean6754

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
cls

echo Stopping DiagTrack...
sc stop diagtrack
echo Stopped Diagtrack
echo.
echo Deleting DiagTrack...
sc delete diagtrack
echo Deleted DiagTrack
PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
color f1
cls

sc stop dmwappushservice
echo Stopped dmwappushservice
echo.
echo Deleting dmwappushservice...
sc delete dmwappushservice
echo Deleted dmwappushservice
PING 127.0.0.1 -n 6 >NUL 2>&1 || PING ::1 -n 6 >NUL 2>&1
color f2

echo Finished!

pause
exit