# Best practices
## Set the following to the default program to open `*.ps1`
```batch
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
```

# How to find the version of PowerShell
```powershell
$PSVersionTable.PSVersion
```

# How to make a PowerShell script runnable by double-clicking
1. Create a shortcut of a ps1 file.
2. Set Target to the following.
```
powershell.exe -Command "& 'C:/foo/bar.ps1'"
```
3. Set Run to "Minimized".

# References
## Best practices
* [Cmdlet Development Guidelines](https://msdn.microsoft.com/en-us/library/ms714657.aspx)
## Misc
* [Windows PowerShell Glossary](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell-glossary)