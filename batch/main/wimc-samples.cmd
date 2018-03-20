@echo off

wmic /output:products.txt product list brief
wmic /output:services.txt service list brief
wmic /output:processes.txt process list brief
wmic /output:startups.txt startup list brief
wmic /output:updates.txt qfe list brief

rem Set priority to the lowest
wmic process where name="foo.exe" call setpriority idle
