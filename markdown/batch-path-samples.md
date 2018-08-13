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