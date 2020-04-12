# Markdowns
* [apt.md](apt.md)
* [awk.md](awk.md)
* [binary.md](binary.md)
* [base64.md](base64.md)
* [curl.md](curl.md)
* [imagemagick.md](imagemagick.md)
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
