@echo off

WMIC.exe /OUTPUT:products.txt PRODUCT LIST BRIEF
WMIC.exe /OUTPUT:services.txt SERVICE LIST BRIEF
WMIC.exe /OUTPUT:processes.txt PROcESS LIST BRIEF
WMIC.exe /OUTPUT:startups.txt STARTUP LIST BRIEF
WMIC.exe /OUTPUT:updates.txt QFE LIST BRIEF

rem Set priority to the lowest
WMIC.exe process where name="foo.exe" call setpriority idle