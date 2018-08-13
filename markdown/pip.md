# How to upgrade pip
```bash
# Run command prompt as administrator in Windows instead of prepending `sudo`
sudo python -m pip install --upgrade pip
```

# How to install a package
```bash
# --user is to install a package deep under %USERPROFILE% so does not require administrative rights
pip install --user --upgrade <package>
```

# How to uninstall a package
```bash
pip uninstall -y <package>
```

# How to list installed packages
```batch
pip list
```

# How to list the installed location of a package
```bash
pip show <package>
```