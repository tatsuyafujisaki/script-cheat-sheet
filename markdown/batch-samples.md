# How to run built-in executables
## whoami
```batch
rem Print <userdomain>/<usename>
whoami

rem Print my account's CN (Common Name) of LDAP in FQDN format
whoami /fqdn
```

## net user
```batch
rem Print the detail of a user
net user <username> /domain
```

## netstat
```batch
rem -a ... shows listening ports
rem -b ... shows process names
rem -f ... shows with FQDN
rem -o ... shows process IDs

netstat -abfo

rem Find open ports. Note that open UDP ports are displayed with "*:*"
netstat  -an | findstr "ESTABLISHED LISTENING *:*" | sort
```

## wmic
```batch
wmic /output:products.txt product list brief
wmic /output:services.txt service list brief
wmic /output:processes.txt process list brief
wmic /output:startups.txt startup list brief
wmic /output:updates.txt qfe listbrief

rem Set priority to the lowest
wmic process where name="foo.exe" call setpriority idle
```

## gpresult
```batch
rem Print RSoP (Resultant Set of Policy) summary data. In other words, it is a list of policies applied to this user.
gpresult /r
```

# How to run .NET tools
## nuget
```batch
rem Place this batch file in a folder where a solution file exists or nuget throws an error.
nuget restore

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

set Project=Project1
set AssemblyName=Assembly1
set AssemblyVersion=2020.1.1.0
set ClickOncePublishVersion=2020.1.1.0
set ClickOnceProductName=Product1

msbuild %Project%\%Project%.csproj "/p:Configuration=Release;AssemblyName=%AssemblyName%;AssemblyVersion=%AssemblyVersion%;ProductName=%ClickOnceProductName%;ApplicationVersion=%ClickOncePublishVersion%" /t:publish /v:m /m /nologo

explorer %Project%\bin\Release\app.publish
```

sn
```batch
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

rem Print PublicKeyToken of a DLL
sn -T Foo.dll
```

## dumpbin
```batch
rem Install "VC++ ... tools" from a Visual Studio installer as it contains dumpbin.exe

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

dumpbin /headers *.exe | findstr /i .pdb
```

## gacutil
```batch
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

rem Print all DLLs in the global assembly cache.
gacutil /l
```

## ildasm
```batch
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\LaunchDevCmd.bat"

rem Output in HTML rather than GUI because the former is in color whereas the latter is in black and white.
ildasm /nobar /source /html /out=%~n1.html %1

start %~n1.html
```

# How to run ImageMagick
```batch
rem Convert .png to .ico
magick foo.png foo.ico

rem Horizontally merge two images
magick convert +append left.jpg right.jpg result.jpg

rem Vertically merge two images
magick convert -append top.jpg bottom.jpg result.jpg

rem Merge three images
magick convert +append upper-left.jpg upper-right.jpg temp.jpg
magick convert -append temp.jpg lower-left.jpg result.jpg
```

# How to run a batch file from a UNC path
```batch
rem Pushd %~dp0 rather than %cd% because %cd% defaults to C:\Windows when the script is on a UNC path.
rem Here, %~dp0 and %cd% are as follows.
rem %~dp0 = \\Foo\Bar
rem %cd% = C:\Windows
pushd %~dp0

rem After this line, use %cd% rather than %~dp0 here because %cd is the real path.
rem Here, %~dp0 and %cd% are as follows.
rem %~dp0 = \\Foo\Bar
rem %cd% = Z:\\Bar
```

# How to reproduce a file
```batch
copy /b /y file1.txt.origin file1.txt
```

# How to find available Wi-Fi
```batch
netsh wlan show network
```
