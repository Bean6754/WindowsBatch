@echo off

REM Stop and disable superfetch.
net stop SysMain
sc config SysMain start= disabled
REM Stop and disable Windows Search
net stop WSearch
sc config WSearch start= disabled
