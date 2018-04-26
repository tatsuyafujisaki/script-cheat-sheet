@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

rem Print all DLLs in the global assembly cache.
gacutil.exe /l
