@echo off

cd /d %~dp0

for /F "tokens=*" %%f in ('dir /b /s /ad bin') do rd /q /s "%%f"
for /F "tokens=*" %%f in ('dir /b /s /ad obj') do rd /q /s "%%f"