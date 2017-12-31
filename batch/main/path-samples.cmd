@echo off

rem Current directory
echo %cd%

rem Script path (can be either full path or relative path)
echo %0

rem Script path (can be either full path or relative path) without double quotation marks
echo %~0

rem Full path
echo %~f0

rem Full path shortened using tildes
echo %~s0

rem Full path without extension
echo %~dp0%~n0

rem Drive
echo %~d0

rem Parent dir path without drive
echo %~p0

rem Parent dir path
echo %~dp0

rem File without extension
echo %~n0

rem Extension
echo %~x0

rem Attributes
echo %~a0

rem Modified datetime
echo %~t0

rem Filesize in kilobytes
echo %~z0

pause