@echo off

REM Content Delivery Manager.
cd %localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager*\Settings
del /F /Q settings.dat

REM Cortana.
cd %localappdata%\Packages\Microsoft.Windows.Cortana*\Settings
taskkill /F /IM explorer.exe
taskkill /F /IM SearchUI.exe
del /F /Q settings.dat
start %SystemRoot%\explorer.exe

REM People.
cd %localappdata%\Packages\Microsoft.Windows.PeopleExperienceHost*\Settings
taskkill /F /IM PeopleExperienceHost.exe
del /F /Q settings.dat
