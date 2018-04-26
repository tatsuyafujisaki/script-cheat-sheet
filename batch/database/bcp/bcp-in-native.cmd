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
set input=%table%.bcp

if not exist %input% (
  echo %input% does not exist.
  pause
  exit /b
)

set /p answer=Do you wish to continue with %database% on %server% ? (y/N):
if /i not %answer% == y exit /b

SQLCMD.EXE -S %server% -d %database% -U %user% -P %password% -Q "TRUNCATE TABLE %schema%.%table%"

rem -E is only in bcp-in
bcp.exe %database%.%schema%.%table% in %input% -n -E -S %server% -U %user% -P %password%