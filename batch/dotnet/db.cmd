@echo off

title %~df0

dumpbin /headers %* | findstr /i .pdb
