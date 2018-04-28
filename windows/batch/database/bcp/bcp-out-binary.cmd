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
set key=key1

set query="SELECT BinaryFile FROM %database%.%schema%.%table% WHERE Key1 = '%key%'"

set output="%key%.dat"
set format="%~n0.fmt"

set /p answer=Do you wish to continue with %database% on %server% ? (y/N):
if /i not %answer% == y exit

if exist %format% (
  bcp.exe %query% queryout %output% -S %server% -U %user% -P %password% -f %format%
) else (
  bcp.exe %query% queryout %output% -S %server% -U %user% -P %password%
  rem How to answer prompts
  rem Enter the file storage type of field val1 [varbinary(max)]: (Enter)
  rem Enter prefix-length of field val1 [8]: 0
  rem Enter length of field val1 [0]: (Enter)
  rem Enter field terminator [none]: (Enter)
  rem Do you want to save this format information in a file? [Y/n] (Enter)
  rem Host filename [bcp.fmt]: (Enter)

  ren bcp.fmt %~n0.fmt
)