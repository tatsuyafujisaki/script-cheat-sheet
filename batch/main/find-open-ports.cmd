@echo off

title %~df0

rem Open UDP ports are displayed with "*:*"
NETSTAT.EXE -an | findstr "ESTABLISHED LISTENING *:*" | sort

pause