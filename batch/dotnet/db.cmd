@echo off

dumpbin /headers %* | findstr /i .pdb
