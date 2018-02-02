# Start a command prompt as an administrator
1. Press Windows key
2. Type `cmd`
3. Ctrl + Shift + Enter

# Note
* `start` command regards the first double-quoted string as a title.
  * https://technet.microsoft.com/en-us/library/cc770297.aspx
* Don't end a then-clause of `if` with a closing parenthesis (`)`) because when a process reaches the then-clause, the process fall through to an else-clause too.
```batch
if %db% == production (
  set /p answer=Do you wish to continue with production database (y/N)
) else (
  set /p answer=Do you wish to continue with database %db% (y/N)
)
```

# References
* [`for`](https://technet.microsoft.com/en-us/library/bb490909.aspx)
* [`if`](https://technet.microsoft.com/en-us/library/bb490920.aspx)
* [Start a Command Prompt as an Administrator](https://technet.microsoft.com/en-us/library/cc947813.aspx)
* [How to run Control Panel tools by typing a command](https://support.microsoft.com/en-us/help/192806/how-to-run-control-panel-tools-by-typing-a-command)