@echo off

title %~df0

rem Output in HTML rather than GUI because the former is color while the latter is black and white.
ildasm.exe /nobar /source /html /out=%~n1.html %1

rem Open with the default browser.
start %~n1.html

rem Ildasm.exe (IL Disassembler)
rem https://msdn.microsoft.com/en-us/library/f7dy01k1.aspx