@echo off

wmic product list brief | sort > products.txt
wmic service list brief | sort > services.txt
wmic process list brief | sort > processes.txt
wmic startup list brief | sort > startups.txt

rem Set priority to the lowest
wmic process where name="foo.exe" call setpriority idle