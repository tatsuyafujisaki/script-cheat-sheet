@echo off

rem If the following leaves the command prompt open ...
call code.cmd %*

rem use the following instead.
start "" "C:\Program Files\Microsoft VS Code\code.exe" %*