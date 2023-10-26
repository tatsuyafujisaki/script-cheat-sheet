# How to install asdf
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

## How to list the installed versions of the Flutter plugin
```shell
asdf list flutter
```
```shell
ls ~/.asdf/installs/flutter/
```

## How to show the versions of the installed plugins
```shell
asdf current
```
```shell
asdf current flutter # flutter only
```
```shell
flutter --version
```

## How to show the installed folder of the Flutter plugin selected in the current folder
```shell
asdf where flutter
```
```shell
asdf which flutter
```

# Not read-only
## How to install a version of the Flutter plugin
```shell
asdf install flutter latest
```
```shell
asdf install flutter <version>
```

## How to uninstall a version of the Flutter plugin
```shell
asdf uninstall flutter latest
```
```shell
asdf uninstall flutter <version>
```

## How to select a version of the Flutter plugin and create `~/.tools-versions`
```shell
asdf global flutter latest
```
```shell
asdf global flutter <version>
```

## How to select a version of the Flutter plugin and create `.tools-versions`
```shell
asdf local flutter latest
```
```shell
asdf local flutter <version>
```

## How to update asdf
```shell
asdf update
```

## How to update all the plugins (including the Flutter plugin)
```shell
asdf plugin update --all
```
