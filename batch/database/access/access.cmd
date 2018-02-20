@echo off

cd /d %~dp0

set db=Database1.accdb
set macro=Macro1
set command=Command1

start /b /max "%db%" /x %macro% /cmd %command%