# Markdowns
* [apt.md](apt.md)
* [awk.md](awk.md)
* [binary.md](binary.md)
* [base64.md](base64.md)
* [curl.md](curl.md)
* [imagemagick.md](imagemagick.md)
* [markdown.md](markdown.md)
* [npm.md](npm.md)
* [pip.md](pip.md)
* [sed.md](sed.md)

# How to create a file with content
```shell
cat << EOF > helloworld.sh
#! /bin/bash
echo Hello
echo World
EOF
```

# How to define an array
```shell
xs1=(aa bb cc)

xs2=(aa
bb
cc
)
```

# How to iterate through an array
```shell
xs=(aa bb cc)
for x in "${xs[@]}"
do
  echo ${x}
done
```

# How to copy a folder to another folder as a subfolder
```shell
# Note "src", not "/src"
rsync -a src dst
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

#change timestamp
touch -d '2011/03/11' foo.txt

#tee both stdout and stderr
./foo.sh 2>&1 | tee -a foo.log

#delete first char
${VAR1#?}

#delete last char
${VAR1%?}

# set JAVA_HOME if not set
[ -z ${JAVA_HOME} ] && export JAVA_HOME=/path/to/javahome

#use DEFAULT_JAVA_HOME if JAVA_HOME not set
DEFAULT_JAVA_HOME=/path/to/javahome
${JAVA_HOME=${DEFAULT_JAVA_HOME}} yourclassfile

#create folder if not found
[ -e ${FOLDER1} ] || mkdir -p ${FOLDER1}

#get timstamp in yyyyymmdd
stat -c %y ${FILE1} | awk '{print $1}' | tr -d '-'

#Get alphabetically-first *.txt
ls /path/to/*.txt | head -1

#Get alphabetically-last *.txt
ls /path/to/*.txt | tail -1

#Get first-modified *.txt
ls -t /path/to/*.txt | tail -1

#Get last-modified *.txt
ls -t /path/to/*.txt | head -1

#Extract file from targz
tar fvxz foo.tar.gz -C /path/to/destination file_in_targz > /dev/null

#Get current shell name
echo $0
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

# GNU Privacy Guard (GPG) cheat sheet
```shell
gpg --full-gen-key

gpg --list-secret-keys
gpg --list-keys

gpg --delete-secret-keys "John Doe"
gpg --delete-keys "John Doe"

gpg -a --export-secret-keys > secret.key
gpg -a --export > public.key

gpg --import public.key
gpg --import secret.key

gpg -a -r "John Doe" --encrypt foo.txt
```

# References
* [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
* [Deprecated Linux networking commands and their replacements](https://www.tecmint.com/deprecated-linux-networking-commands-and-their-replacements)
