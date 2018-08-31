@echo off

title %~df0

cd /d %~dp0

rem Exit from a batch, but not cmd.exe.
exit /b

rem Print a blank line. (Note that "." follows echo.)
echo.

rem Open the current directory using Explorer.
explorer .

rem Open a directory in command line and stay there.
cmd /k "cd /d %TEMP%"

rem Run multiple commands in a line.
cmd /c "cd /d C:\dir1 && echo "Success"
cmd /c "cd /d C:\dir2 || echo "Failure"

rem Move to a directory in a different drive
cd /d "A directory in a different drive"

set /p db=< %~dp0db.txt
set /p answer=Do you wish to continue with %db% ? (y/N):
if /i not %answer% == y exit /b

rem Echo without a new line
echo | set /p=I don't have a new line!

rem Execute Command A, then execute Command B (no evaluation of anything)
Command A & Command B

rem Execute Command A, and redirect all its output into the input of Command B
Command A | Command B

rem Execute Command A, evaluate the errorlevel after running and if the exit code (errorlevel) is 0, only then execute Command B
Command A && Command B

rem Execute Command A, evaluate the exit code of this command and if it's anything but 0, only then execute Command B
Command A || Command B

rem Error handling with goto 1
echooo foo || goto Error

rem Error handling with goto 2
echooo foo
if errorlevel 1 goto Error

rem Error handling with goto 3
echo foo
if not errorlevel 1 goto NonError

rem "if errorlevel n" should be read as "if errorlevel >= n"
rem e.g. "if errorlevel 0" is always true.

rem Error handling without goto 1
echooo foo || (echo Error! & pause & exit /b)

rem Error handling without goto 2
echooo foo
if errorlevel 1 (echo Error! & pause & exit /b)

rem Use "call" to run a batch from another batch
call batch1.cmd

rem Make an empty file
copy /y nul foo.txt > nul

rem Read the first line of file
set /p firstline=< file.txt
set echo %firstline%

rem Get the first 8 characters (useful if a file has yyyymmdd at the beginning)
set first8chars=%firstline:~0,8%
echo %first8chars%

rem See "if /?" for details.

if "foo" == "bar" (
  echo foo is equal to bar.
) else (
  echo foo is not equal to bar.
)

if 1 lss 2 ( echo 1 is less than or 2. )
if 1 leq 2 ( echo 1 is less than or equal to 2. )
if 2 gtr 1 ( echo 2 is greater than or 1. )
if 2 geq 1 ( echo 2 is greater than or equal to 1. )

rem How to loop 1 (recommended)
set ss=(foo bar baz)
for %%s in %ss% do (
    echo %%s
)

rem How to loop 2
set ss=( ^
foo ^
bar ^
baz ^
)
for %%s in %ss% do (
    echo %%s
)

rem How to loop 3
set ss=foo;bar;baz
for %%s in (%ss%) do (
    echo %%s
)

rem Start "yourtitle" command
set titles=(foo bar baz)
for %%t in %titles% do (
    start "%%t" echo %%t
)

rem Print files in the script directory and its subdirectories
for /r %~dp0 %%f in (*.txt) do (
    echo %%f
)

rem Print dirs in the script directory
for /d %%d in (%~dp0\*) do (
    echo %%d
)

rem Check if a parameter is passed
if "%1"=="" (
    echo A parameter is not passed.
    exit /b
)

rem Prevent the script from being run on network drive.
if "%~d0" neq "C:" (
  echo.
  echo ############################################
  echo   Please run this script on a local drive.
  echo ############################################
  echo.
  pause
  exit /b
)

rem Replace a pattern in a file
copy /y nul replaced.txt > nul
setlocal enabledelayedexpansion
rem "tokens=*" is to read a line to the end even if the line contains a space in the middle.
for /F "tokens=*" %%l in (original.txt) do (
    set line=%%l
    echo !line:before=after! >> replaced.txt
)
endlocal

rem Wait for 5 seconds
timeout 5

rem Create a directory if it does not exist in the top directory.
if not exist dir1 ( md dir1 )

rem Delete a file if it exists in the top directory.
if exist file1 ( del /f /q file1 )

rem Delete a directory if it exists in the top directory.
if exist dir1 ( rd /q /s dir1 )

rem Delete a directory if it exists in the top directory without throwing an error even if the specified directory is locked and fails to be deleted.
rd /q /s dir1 > nul 2>&1

rem Delete a directory if it is a subdirectory.
for /F "tokens=*" %%f in ('dir /b /s /ad dir1') do rd /q /s "%%f"

rem Empty a directory.
if exist dir1 ( del /f /q /s dir1 )

rem Example 1 of 'for'
rem "tokens=*" is to read a line to the end even if the line contains a space in the middle.
for /F "tokens=*" %%l in (foo.txt) do (
    echo %%l
)

rem Example 2 of 'for'
rem Result ... a c %k
for /F "tokens=1,3" %%i in ("a b c d e") do (
    echo %%i %%j %%k
)

rem Example 3 of 'for'
rem Result ... a c d e (Comma before '*' can be omitted.)
for /F "tokens=1,3,*" %%i in ("a b c d e") do (
    echo %%i %%j %%k
)

rem Example 1 of getting a path to desktop
echo %USERPROFILE%\Desktop

rem Example 2 of getting a path to desktop
for /F "tokens=3" %%1 in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do (
    set desktop=%%1
)
echo %desktop%

rem Copy a whole directory
xcopy C:\from C:\to /e /i /y

rem Copy a file
copy /b /y file1.txt file2.txt

rem Concatenate files
copy foo.txt + bar.txt foobar.txt

pause
exit /b

:Error
echo Error!
pause
