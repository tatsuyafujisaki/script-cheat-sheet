@echo off

taskkill.exe /f ^
/im Code.exe ^
/im EXCEL.EXE ^
/im MSBuild.exe ^
/im NOTEPAD.EXE ^
/im WINWORD.EXE 2> nul