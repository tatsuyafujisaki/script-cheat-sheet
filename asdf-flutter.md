# Flutter version management using [asdf](https://github.com/asdf-vm/asdf)
## How to install asdf
The official website recommends installing asdf using `git clone` rather than Homebrew or Pacman.

> We highly recommend using the official git method.

https://asdf-vm.com/guide/getting-started.html

## How to add the Flutter plugin (which allows you to install versions of Flutter)
```shell
asdf plugin add flutter
```

## How to list the installable versions of Flutter
```shell
asdf list all flutter
```

## How to list the installed versions of Flutter
```shell
asdf list flutter
```
Alternatively
```shell
ls ~/.asdf/installs/flutter/
```

## How to install a version of Flutter
```shell
asdf install flutter 3.0.0-stable
```

## How to select a version of Flutter to use in the current folder
```shell
asdf local flutter 3.0.0-stable # creates .tool-versions
flutter --version # to confirm the version of Flutter in the current folder
```
