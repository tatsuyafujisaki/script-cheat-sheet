# Note
Install a VSTO application. (Adding "/s" does not install the app with a trust prompt.)
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /i Foo.vsto
```

Uninstall a VSTO application
```batch
"C:\Program Files\Common Files\microsoft shared\VSTO\10.0\VSTOInstaller.exe" /s /u Foo.vsto
```

# References
[Create a custom installer](https://docs.microsoft.com/en-us/visualstudio/vsto/deploying-an-office-solution-by-using-clickonce#Custom)