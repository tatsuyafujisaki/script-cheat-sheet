@echo off

title %~df0

rem List all DLLs in the global assembly cache.
gacutil /l

rem Gacutil.exe (Global Assembly Cache Tool)
rem https://msdn.microsoft.com/en-us/library/ex0ss12c.aspx