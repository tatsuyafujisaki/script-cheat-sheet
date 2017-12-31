# Best practices
* [Cmdlet Development Guidelines](https://msdn.microsoft.com/en-us/library/ms714657.aspx)

# How to make a PowerShell script runnable by double-clicking
1. Create a shortcut of a ps1 file.
2. Set Target to the following.
```
powershell.exe -Command "& 'C:/foo/bar.ps1'"
```
3. Set Run to "Minimized".

# References
* [Windows PowerShell Glossary](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell-glossary)