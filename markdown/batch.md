# Template
```batch
@echo off

title %~df0

cd /d "%~dp0"
```

# Note
* `%RANDOM%` outputs a random number between 0 and 32767.
* `start` command regards the first double-quoted string as a title.
  * https://technet.microsoft.com/en-us/library/cc770297.aspx
* `start <file>` opens `<file>` with the default program.
* Extensions of executables included `%PATHEXT%` are omissible.
* Don't end a then-clause of `if` with a closing parenthesis (`)`) because when a process reaches the then-clause, the process falls through to an else-clause too.
```batch
if %db% == production (
  set /p answer=Do you wish to continue with production database (y/N)
) else (
  set /p answer=Do you wish to continue with database %db% (y/N)
)
```

# Best practices
* Add `@echo off` to any batch file.
* Add `title %~df0` to a batch file if it requires any user interaction to close the console.
* Add `cd /d %~dp0` to a batch file if it uses its parent directory.
* Be case-sensitive in folder names, file names and command-line switches for clarity.

# How to start a command prompt as an administrator
1. Press Windows key
2. Type `cmd`
3. Ctrl + Shift + Enter

# Special commands to open special folders
* Typing "." opens %USERPROFILE% with Explorer
* Typing "TEMP" opens %TEMP% with Explorer
  * Typing "%TEMP%" has the same effect

# VSTO (Visual Studio Tools for Office)
Install a VSTO application. (Adding "/s" does not install the app with a trust prompt.)
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /i Foo.vsto
```

Uninstall a VSTO application
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /s /u Foo.vsto
```

## References
[Create a custom installer](https://docs.microsoft.com/en-us/visualstudio/vsto/deploying-an-office-solution-by-using-clickonce#Custom)

# References
* [`for`](https://technet.microsoft.com/en-us/library/bb490909.aspx)
* [`if`](https://technet.microsoft.com/en-us/library/bb490920.aspx)
* [Start a Command Prompt as an Administrator](https://technet.microsoft.com/en-us/library/cc947813.aspx)
* [How to run Control Panel tools by typing a command](https://support.microsoft.com/en-us/help/192806/how-to-run-control-panel-tools-by-typing-a-command)
* [Command-line switches for Microsoft Office products](https://support.office.com/en-us/article/command-line-switches-for-microsoft-office-products-079164cd-4ef5-4178-b235-441737deb3a6)