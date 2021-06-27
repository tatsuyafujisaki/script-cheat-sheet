# How to denote required and optional arguments on the command line
* `<required_argument>`
* `[optional_argument]`
* https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html

# Bash/Zsh
## How to restart the shell
```shell
exec -l $SHELL
```

## How to show the definition of an alias
```shell
alias <alias-name>
```

## How to print date and time in yyyymmdd-hhmmss
```shell
date +%Y%m%d-%H%M%S
```

## How to remove the first or the last character from a variable
```shell
s=abc
echo ${s#?} # bc
echo ${s%?} # ab
```

## How to create a folder if it does not exist
```shell
folder1=~/foo
[ -e ${folder} ] || mkdir -p ${folder}
```

## How to redirect stdout and/or stderr
```shell
echo hello > /dev/null # redirects stdout only.
echo hello 2> /dev/null # redirects stderr only.
echo hello &> /dev/null # redirects both stdout and stderr.
```

## How to replace or delete substring(s)
```shell
S=old_and_old
echo ${S/old} # deletes the first "old" and shows "_and_old".
echo ${S//old} # deletes all the "old" and shows "_and_".
echo ${S/old/new} # replace the first "old" and shows "new_and_old".
echo ${S//old/new} # replace all the "old" and shows "new_and_new".
```

## How to create a file with content
```shell
cat << EOF > sample.txt
aa
bb
cc
EOF
```

## How to define an array
```shell
xs1=(aa bb cc)

xs2=(aa
bb
cc
)
```

## How to iterate through an array
```shell
xs=(aa bb cc)
for x in "${xs[@]}"
do
  echo ${x}
done
```

## How to resolve a relative path to the absolute path
```shell
realpath <file-or-folder>
```

## How to detect the encoding of a file on both Mac/Linux
```shell
file -b sample.txt
```

# Zsh
## How to keep a background job running even after Zsh is closed
```shell
<command> &|
```
http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html

# How to copy a folder to another folder as a subfolder
```shell
rsync -a src dst # Note that it's not "/src" but "src"
```

# How to copy only the content of a folder to another folder
```shell
# Note "src/", not "src"
rsync -a src dst
```

# How to convert multiple lines to a single line
```shell
$ cat input.txt
aa
bb
cc

$ paste -s -d, input.txt
aa,bb,cc
```

# How to merge files horizontally without using a matching column
```shell
$ cat left.txt
aa
bb

$ cat right.txt
xx
yy

$ paste -d, left.txt right.txt
aa,xx
bb,yy

$ paste -d'\0' left.txt right.txt
aaxx
bbyy
```

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

# Misc cheet sheet
```shell
#kill found processes
ps aux | grep "my_process_name" | awk '{ print $2 }' | xargs kill

#check if command exists
command -v foo > /dev/null 2>&1 || echo 'command not found.'

#one liner
true && { echo 'true1'; echo 'true2'; } || { echo 'false1'; echo 'false2'; }
false && { echo 'true1'; echo 'true2'; } || { echo 'false1'; echo 'false2'; }

# tee both stdout and stderr
./foo.sh 2>&1 | tee -a foo.log

# set JAVA_HOME if not set
[ -z ${JAVA_HOME} ] && export JAVA_HOME=/path/to/javahome

#use DEFAULT_JAVA_HOME if JAVA_HOME not set
DEFAULT_JAVA_HOME=/path/to/javahome
${JAVA_HOME=${DEFAULT_JAVA_HOME}} yourclassfile

#get timstamp in yyyyymmdd
stat -c %y ${FILE1} | awk '{print $1}' | tr -d '-'

#Extract file from targz
tar fvxz foo.tar.gz -C /path/to/destination file_in_targz > /dev/null
```

# Regex
## How to check if `${s}` matches `${regex}`
```shell
## '=~' is to enable regex in 'if' statement. http://tldp.org/LDP/abs/html/special-chars.html
[[ ${s} =~ ${regex} ]] && echo "matched" || echo "unmatched"
```

## How to check if `${digits}` is digits.
```shell
[[ ${digits} =~ ^[[:digit:]]+$ ]] && echo "matched" || echo "unmatched"
```

# Path cheat sheet
```shell
echo 'original:' ${s}

echo 'dirname (#1) :' ${s%/*}
echo 'dirname (#2) :' $(dirname ${s})
echo 'filename without dir (#1) :' ${s##*/}
echo 'filename without dir (#2) :' $(basename ${s})
echo 'filename without extension :' $(basename ${s} .${s##*.})
echo 'fullpath without extension :' ${s%.*}
echo 'extname: ' ${s##*.}

echo 'fullpath: ' $(readlink -f ./../relative/path/to/foo.txt)

echo 'script dir as relative path: ' ${0%/*}
echo 'script dir as absolute path: ' $(cd ${0%/*} && pwd && cd - > /dev/null)
```

# References
* [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
* [Deprecated Linux networking commands and their replacements](https://www.tecmint.com/deprecated-linux-networking-commands-and-their-replacements)
