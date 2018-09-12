@echo off

title %~df0

cd /d %~dp0

ftp -i -s:"%~dp0%~n0.txt"

rem FTP globbing is the same as csh and so primitive that it supports neither \d for digits nor {n} for repetition nor $ for ending.
rem If you want to mget files and one of which is named foo.txt.{yyyymmdd}, your best option is foo.txt.[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].