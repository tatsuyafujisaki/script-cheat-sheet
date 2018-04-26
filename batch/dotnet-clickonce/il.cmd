@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

rem Output in HTML rather than GUI because the former is in color whereas the latter is in black and white.
ildasm.exe /nobar /source /html /out=%~n1.html %1

start %~n1.html
