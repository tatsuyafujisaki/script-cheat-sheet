# How to find the version of PowerShell
```powershell
$PSVersionTable.PSVersion
```

# How to make a PowerShell script runnable by double-clicking
1. Create a shortcut of a ps1 file.
2. Set Target to the following.
```
powershell -Command "& 'C:/foo.ps1'"
```
3. Set Run to "Minimized".