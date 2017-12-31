@echo off

title %~df0

rem Assume %date% = yyyy/mm/dd
set yyyymmdd=%date:/=%

rem Assume %date% = yy/mm/dd
set yyyymmdd=20%date:/=%

rem Assume %date% = mm/dd/yyyy 
set yyyymmdd=%date:~6,4%%date:~0,2%%date:~3,2%

rem Get time with hour padded with a leading zero when hour is between 0 and 9.
set t=%time: =0%

rem Assume %t% is hh:mm:ss.ss
set hhmmss=%t:~0,2%%t:~3,2%%t:~6,2%