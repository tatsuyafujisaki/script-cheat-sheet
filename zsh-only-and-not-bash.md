# Sample function that requires two arguments
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

# How to get the basename and the extension of a file
```shell
s=sample.txt
echo $s:r # sample
echo $s:e # txt
```

# How to keep a background job running even after Zsh is closed
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
```

# How to reference the home directory in zsh where the tilde (~) in single-quotes or double-quotes is not expanded
Use `$HOME`.
