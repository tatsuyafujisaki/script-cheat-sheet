@echo off

title %~df0

cd /d %~dp0

call clean.cmd

shutdown /f /p