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

set SQLCMDSERVER=server1
set SQLCMDDBNAME=dbname1
set SQLCMDUSER=user1
set SQLCMDPASSWORD=password1

set /p answer=Do you wish to continue with %SQLCMDDBNAME% on %SQLCMDSERVER% ? (y/N):
if /i not %answer% == y exit

SQLCMD.EXE -f 932 -Q "TRUNCATE TABLE Table1"