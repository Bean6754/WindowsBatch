@ECHO OFF

REM Depriciated!!
REM Please use "Get-WinUserLanguageList" in PowerShell!!

SET X=%WINDIR%\System32
CD %X%

REM lpksetup.exe - Default.
REM lpksetup.exe /i - Install.
REM lpksetup.exe /u - Uninstall
REM lpksetup.exe /? - List

lpksetup.exe

PAUSE
EXIT
