Assume %date% = yyyy/mm/dd
```batch
set yyyymmdd=%date:/=%
```

Assume %date% = yy/mm/dd
```batch
set yyyymmdd=20%date:/=%
```

Assume %date% = mm/dd/yyyy
```batch
set yyyymmdd=%date:~6,4%%date:~0,2%%date:~3,2%
```

Get time with hour padded with a leading zero when hour is between 0 and 9
```batch
set t=%time: =0%
```

Assume %t% is hh:mm:ss.ss
```batch
set hhmmss=%t:~0,2%%t:~3,2%%t:~6,2%
```