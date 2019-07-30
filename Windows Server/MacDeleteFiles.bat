@ECHO OFF

COLOR 04

DEL /F /S /Q .fseventsd
RMDIR /S /Q .fseventsd

DEL /F /S /Q .Spotlight-V100
RMDIR /S /Q .Spotlight-V100

DEL /F /S /Q .DS_Store

DEL /F /S /Q /A:H ._*
