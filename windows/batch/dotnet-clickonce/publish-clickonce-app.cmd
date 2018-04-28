@echo off

rem Place this batch file in a folder where a solution file exists or nuget throws an error.
nuget.exe restore

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

set Project=Project1
set AssemblyName=Assembly1
set AssemblyVersion=2020.1.1.0
set ClickOncePublishVersion=2020.1.1.0
set ClickOnceProductName=Product1

MSBuild.exe %Project%\%Project%.csproj "/p:Configuration=Release;AssemblyName=%AssemblyName%;AssemblyVersion=%AssemblyVersion%;ProductName=%ClickOnceProductName%;ApplicationVersion=%ClickOncePublishVersion%" /t:publish /v:m /m /nologo

explorer.exe %Project%\bin\Release\app.publish