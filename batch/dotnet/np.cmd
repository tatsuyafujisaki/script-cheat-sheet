@echo off

title %~df0

rem "for" is to convert a wildcard character "*" to an actual name because NuGet does not accept wildcard characters.
for %%f in (*.csproj) do (
  nuget pack %%f -Build
)