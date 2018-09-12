@echo off

javaws -uninstall

del /f /q /s %TEMP% > nul 2>&1

cd /d C:\
del *.log /f /q /s > nul 2>&1

rem Clear "Find" history in Visual Studio 2015 and 2013
rem reg delete HKCU\SOFTWARE\Microsoft\VisualStudio\14.0\Find /f > nul 2>&1
rem reg delete HKCU\SOFTWARE\Microsoft\VisualStudio\12.0\Find /f > nul 2>&1

rem There has been no programmatic way to clear "Find" history since Visual Studio 2017
rem https://github.com/Microsoft/VSProjectSystem/blob/master/doc/overview/examine_registry.md
rem https://visualstudio.uservoice.com/forums/121579-visual-studio-ide/suggestions/19961509-able-to-clear-find-replace-history-list

rem Administrator privileges is NOT required to show admin-only items in sageset
rem cleanmgr /sageset:0

rem Administrator privileges is required to show admin-only items in sagerun
cleanmgr /sagerun:0

defrag /C /M /X
