@echo off

title %~df0

if "%~d0" neq "C:" (
  echo.
  echo ############################################
  echo   Please run this script on a local drive.
  echo ############################################
  echo.
  pause
  exit /b
)

cd /d %~dp0

set server=server1
set database=database1
set schema=schema1
set user=user1
set password=password1
set table=table1
set output=%table%.bcp

set /p answer=Do you wish to continue with %database% on %server% ? (y/N):
if /i not %answer% == y exit /b

bcp.exe %database%.%schema%.%table% out %output% -n -S %server% -U %user% -P %password%