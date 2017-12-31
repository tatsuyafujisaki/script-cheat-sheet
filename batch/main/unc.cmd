@echo off

title %~df0

rem Pushd %~dp0 rather than %cd% because %cd% defaults to C:\Windows when the script is on a UNC path.
rem Here, %~dp0 and %cd% are as follows.
rem %~dp0 = \\Foo\Bar
rem %cd% = C:\Windows
pushd %~dp0

rem After this line, use %cd% rather than %~dp0 here because %cd is the real path.
rem Here, %~dp0 and %cd% are as follows.
rem %~dp0 = \\Foo\Bar
rem %cd% = Z:\\Bar
