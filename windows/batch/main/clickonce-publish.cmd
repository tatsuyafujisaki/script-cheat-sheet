@echo off

cd /d %~dp0

rem Delete "bin" and "obj" folders
for /F "tokens=*" %%f in ('dir /b /s /ad bin') do rd /q /s "%%f" > nul 2>&1
for /F "tokens=*" %%f in ('dir /b /s /ad obj') do rd /q /s "%%f" > nul 2>&1

rem Visual Studio 2017
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"

rem Visual Studio 2015
rem call "C:\Program Filse (x86)\Microsoft Visual Studio 15.0\Common7\Tools\VsDevCmd.bat"

nuget restore > nul 2>&1

set AssemblyName=Project1
set ClickOnceProductName=Project1
set ClickOnceApplicationVersion=2020.7.24.0

msbuild Project1\Project1.csproj /p:Configuration=Release;AssemblyName=%AssemblyName%;ProductName=%ClickOnceProductName%;ApplicationVersion=%ClickOnceApplicationVersion%" /t:publish /v:m /m /nologo

set DestinationFolder=C:\Foo
xcopy Project1\bin\Release\app.publish %DestinationFolder% /e /i /y

pause

rem https://docs.microsoft.com/en-us/visualstudio/deployment/building-clickonce-applications-from-the-command-line
