@echo off

rem Output in HTML rather than GUI because the former is in color whereas the latter is in black and white.
ildasm.exe /nobar /source /html /out=%~n1.html %1

start %~n1.html

rem https://docs.microsoft.com/en-us/dotnet/framework/tools/ildasm-exe-il-disassembler