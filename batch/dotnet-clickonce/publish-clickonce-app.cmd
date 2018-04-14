@echo off

rem Place this batch file in a folder where a solution file exists or nuget throws an error.
nuget restore

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"

set AssemblyName=Assembly1
set ClickOncePublishVersion=2020.1.1.0
set ClickOnceProductName=Product1

msbuild Project1\Project1.csproj "/p:Configuration=Release;AssemblyName=%AssemblyName%;ProductName=%ClickOnceProductName%;ApplicationVersion=%ClickOncePublishVersion%" /t:publish /v:m /m /nologo

explorer Project1\bin\Release\app.publish

pause