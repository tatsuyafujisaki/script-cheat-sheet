# Template
```batch
@echo off

title %~df0

cd /d "%~dp0"
```

# Note
* `%RANDOM%` outputs a random number between 0 and 32767.
* If the extensions of executables are in `%PATHEXT%`, they are omissible.
* `start` command regards the first double-quoted string as a title.
* `start <file>` opens `<file>` with the default program.
* Don't end a then-clause of `if` with a closing parenthesis `)` because when a process reaches the then-clause, the process falls through to an else-clause too.
```batch
if %db% == production (
  set /p answer=Do you wish to continue with production database (y/N)
) else (
  set /p answer=Do you wish to continue with database %db% (y/N)
)
```

# How to start a command prompt as an administrator
1. Press Windows key
2. Type `cmd`
3. Ctrl + Shift + Enter

# Special commands to open special folders in Explorer
* `.` command opens `%USERPROFILE%` in Explorer
* `temp` command opens `%TEMP%` in Explorer

# VSTO (Visual Studio Tools for Office)
## How to install a VSTO application. Note that adding `/s` fails to install apps that try to show a trust prompt.
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /i Foo.vsto
```

## How to uninstall a VSTO application
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /s /u Foo.vsto
```

## References
[Create a custom installer](https://docs.microsoft.com/en-us/visualstudio/vsto/deploying-an-office-solution-by-using-clickonce#Custom)

# Path
Absolute path to current directory
```batch
echo %cd%
```

Absolute or relative path to script with double quotes
```batch
echo %0
```

Absolute or relative path to script without double quotes
```batch
echo %~0
```

Absolute path to script
```batch
echo %~f0
```

Shortened absolute path to script using tildes
```batch
echo %~s0
```

Absolute path to script without extension
```batch
echo %~dp0%~n0
```

Drive
```batch
echo %~d0
```

Absolute path to parent directory of script without drive
```batch
echo %~p0
```

Absolute path to parent directory of script
```batch
echo %~dp0
```

File name without extension
```batch
echo %~n0
```

Extension
```batch
echo %~x0
```

Attributes
```batch
echo %~a0
```

Modified datetime
```batch
echo %~t0
```

Filesize in kilobytes
```batch
echo %~z0
```

# References
* [`for`](https://technet.microsoft.com/en-us/library/bb490909.aspx)
* [`if`](https://technet.microsoft.com/en-us/library/bb490920.aspx)
* [Start a Command Prompt as an Administrator](https://technet.microsoft.com/en-us/library/cc947813.aspx)
* [How to run Control Panel tools by typing a command](https://support.microsoft.com/en-us/help/192806/how-to-run-control-panel-tools-by-typing-a-command)
* [Command-line switches for Microsoft Office products](https://support.office.com/en-us/article/command-line-switches-for-microsoft-office-products-079164cd-4ef5-4178-b235-441737deb3a6)
