@echo off

title %~df0

rem Open UDP ports are displayed with "*:*"
netstat -an | findstr "ESTABLISHED LISTENING *:*" | sort