@echo off
 
title %~df0

if "%1"=="" (
    echo Please pass the full path of a file or folder.
    exit /b
)

set /p answer=Do you wish to grant everyone full access to "%1" ? (y/N):
if /i not %answer% == y exit /b

rem Take ownership.
takeown /f "%1" /r /d Y

rem Grant everyone full access.
icacls "%1" /grant Everyone:F /t

rem Note
rem You cannot grant everyone full access only in one command.

rem takeown
rem https://technet.microsoft.com/en-us/library/cc753024.aspx

rem icacls
rem https://technet.microsoft.com/en-us/library/cc753525.aspx