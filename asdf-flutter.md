# One-off
## How to install asdf
https://asdf-vm.com/guide/getting-started.html

> We highly recommend using the official git method.

The official website prefers `git clone` to Homebrew or Pacman.

## How to add the Flutter plugin (which allows you to install versions of Flutter)
```shell
asdf plugin add flutter
```

# Read-only
## How to list the installable versions of the Flutter plugin
```shell
asdf list all flutter
```

## How to list the installed versions of the Flutter plugins
```shell
asdf list flutter

# Alternatively
ls ~/.asdf/installs/flutter/
```

## How to show the versions of the installed plugins selected in the current folder
```shell
asdf current

# Flutter plugin only
asdf current flutter

# Alternatively
flutter --version
```

## How to show the installed folder of the Flutter plugin selected in the current folder
```shell
asdf where flutter
asdf which flutter
```

# Not read-only
## How to install a version of the Flutter plugin
```shell
asdf install flutter latest
asdf install flutter 3.3.10-stable # alternatively
asdf install flutter 3.7.12-stable # alternatively
```

## How to select a version of the Flutter plugin to use in the current folder
```shell
# global
asdf global flutter latest # creates ~/.tool-versions
asdf global flutter 3.3.10-stable # alternatively
asdf global flutter 3.7.12-stable

# local
asdf local flutter latest # creates .tool-versions
asdf local flutter 3.3.10-stable # alternatively
asdf local flutter 3.7.12-stable # alternatively
```

## How to update asdf
```shell
asdf update
```

## How to update all the plugins (including the Flutter plugin)
```shell
asdf plugin update --all
```
