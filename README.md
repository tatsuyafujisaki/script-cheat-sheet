# How to denote required and optional arguments on the command line
* `<required_argument>`
* `[optional_argument]`

https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html

# Bash/Zsh
# How to define and iterate over an array in Bash or Zsh
```shell
for x in 🍎 🍏 🍊
do
  echo ${x}
done
```
```shell
xs=(🍎 🍏 🍊)

for x in "${xs[@]}"
do
  echo ${x}
done
```
```shell
xs=(
🍎
🍏
🍊
)

for x in "${xs[@]}"
do
  echo ${x}
done
```

# How to traverse all the direct subdirectories in Bash or Zsh
```shell
for dir in */
do
  echo $dir
done
```

# How to traverse all the direct and indirect subdirectories in Bash or Zsh
```shell
for dir in **/
do
  echo $dir
done
```

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
echo 🍎 > /dev/null # redirects stdout only.
echo 🍎 2> /dev/null # redirects stderr only.
echo 🍎 &> /dev/null # redirects both stdout and stderr.
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
