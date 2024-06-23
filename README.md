# How to denote required and optional arguments on the command line
* `<required_argument>`
* `[optional_argument]`

https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html

# Bash/Zsh
## How to find the absolute script path in Bash or Zsh
```shell
echo $(realpath $0)
```

## How to find the absolute script directory in Bash or Zsh
```shell
echo $(cd ${0%/*} && pwd -P)
```

## How to find the script's filename extension in Bash or Zsh
```shell
echo ${0##*.}
```

## How to restart the shell in Bash or Zsh
```shell
exec -l $SHELL
```

## How to print date and time in yyyy-mm-dd_hh-mm-ss in Bash or Zsh
```shell
date +%Y-%m-%d_%H-%M-%S
```

## How to remove the first or the last character from a variable in Bash or Zsh
```shell
s=🍎🍏🍊
echo ${s#?} # 🍏🍊
echo ${s%?} # 🍎🍏
```

## How to create a directory if it does not exist in Bash or Zsh
```shell
directory=~/Desktop/foo
[ -e ${directory} ] || mkdir -p ${directory}
```

## How to redirect stdout and/or stderr in Bash or Zsh
```shell
echo hello > /dev/null # redirects stdout only.
echo hello 2> /dev/null # redirects stderr only.
echo hello &> /dev/null # redirects both stdout and stderr.
```

## How to replace or delete substring(s) in Bash or Zsh
```shell
S=🍎_🍎
echo ${S/🍎} # _🍎
echo ${S//🍎} # _
echo ${S/🍎/🍊} # 🍊_🍎
echo ${S//🍎/🍊} # 🍊_🍊
```

## How to create a file with content in Bash or Zsh
```shell
cat << EOF > sample.txt
🍎
🍏
🍊
EOF
```

## How to detect the encoding of a file in Bash or Zsh
```shell
file --brief input.txt
```

# How to copy a folder into another folder
```shell
rsync --archive src dst
```

# How to convert multiple lines to a single line in Bash or Zsh
```shell
$ cat input.txt
🍎
🍏
🍊

$ paste -s -d, input.txt
🍎,🍏,🍊
```


# How to merge files horizontally without using a matching column in Bash or Zsh
```shell
$ cat left.txt
🍎
🍏

$ cat right.txt
🍊
🍋

$ paste -d, left.txt right.txt
🍎,🍊
🍏,🍋

$ paste -d'\0' left.txt right.txt
🍎🍊
🍏🍋
```

# Zsh
## Sample function that requires two arguments
```shell
my_function() {
  if [ $# -lt 2 ]
  then
    echo "Usage: $funcstack[1] <first-argument> <second-argument>"
    return
  fi

  echo "First argument: $1"
  echo "Second argument: $2"
}
```
```shell
$ my_function
Usage: my_function <first-argument> <second-argument>

$ my_function foo
Usage: my_function <first-argument> <second-argument>

$ my_function foo bar
First argument: foo
Second argument: bar
```

## How to get the basename and the extension of a file
```shell
s=sample.txt
echo $s:r # sample
echo $s:e # txt
```

## How to keep a background job running even after Zsh is closed
```shell
<command> &|
```
https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html

# How to concatenate files horizontally excluding unmatched rows without using a matching column
* `-t` is a separator
* `-1` is the one-based index of a matching column from a first input file.
* `-2` is the one-based index of a matching column from a second input file.
```shell
$ cat foo.txt
1,aa
2,bb
4,cc

$ cat bar.txt
1,xx
2,yy
5,zz

$ join -t, -1 1 -2 2 foo.txt bar.txt
1,aa,xx
2,bb,yy
````

# Array
[array.md](shell/markdown/array.md)

# Directory
[directory.md](shell/markdown/directory.md)

# Regex
[regex.md](shell/markdown/regex.md)
