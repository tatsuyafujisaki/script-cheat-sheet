@echo off

rem dumpbin.exe is part of C++ toolset that is an optional component of Visual Studio.
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

dumpbin.exe /headers %* | findstr /i .pdb