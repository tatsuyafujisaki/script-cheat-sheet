# Other markdowns
- [apt.md](apt.md)
- [base64.md](base64.md)
- [curl.md](curl.md)
- [imagemagick.md](imagemagick.md)

# How to launch Chrome from Terminal on macOS using basic access authentication.
```shell
open -a 'Google Chrome' https://username:password@example.com/foo/
```

## Note
* Since Chrome 59, URLs with an embedded credential for subresources (e.g. `https://username:password@example.com/foo/` or `https://username:password@example.com/bar.jpg`) have been unavailable while URLs with an embedded credential for main resources (e.g. `https://username:password@example.com`) are still available. But still, URLs with an embedded credential for subresources are available if launched from Terminal.
  * https://www.chromestatus.com/feature/5669008342777856

# What is `--` in Bash?
> Unless otherwise noted, each builtin command documented as accepting options preceded by ‘-’ accepts ‘--’ to signify the end of the options. The :, true, false, and test builtins do not accept options and do not treat ‘--’ specially.

https://www.gnu.org/software/bash/manual/bash.html#Shell-Builtin-Commands

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

# How to add a prefix to lines
```shell
sed 's/^/prefix/' input.txt > output.txt

# In-place
sed -i 's/^/prefix/' input.txt
```

# How to add a suffix to lines
```shell
sed "s/$/suffix/" input.txt > output.txt

# In-place
sed -i "s/$/suffix/" input.txt
```

# How to replace strings
```shell
sed "s/old/new/g" input.txt > output.txt

# In-place replacement
sed -i "s/old/new/g" input.txt
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

# How to concatenate files horizontally without using a matching column
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

# Comparison among `xxd`, `hexdump`, and `od`
||`xxd -g1`|`hexdump -C`|`od -Ax -tx1`
|---|---|---|---
|Can display hex with ASCII side-by-side|Yes|Yes|No
|Performance (*1)|Fastest|Slowest|Middle
|Program size|12KB|16KB|16KB
|Age|Middle|Youngest|Oldest
|Meaning of arguments|`-g1` is to separate hex separating each byte.|`-C` is to display ASCII to the right of hex.|`-Ax` is to display address in hex. `-tx1` is to display hex separating each byte.

(*1) Performance comparison
```shell
$ time -f '%e' cat /bin/sh | xxd -g1 > /dev/null
0.03

$ time -f '%e' cat /bin/sh | hexdump -C > /dev/null
0.17

$ time -f '%e' cat /bin/sh | od -Ax -tx1 > /dev/null
0.07
```

# References
* [Google Shell Style Guide](https://google.github.io/styleguide/shell.xml)
* [GNU Bash Reference](https://www.gnu.org/software/bash/manual/bash.html)
* [GNU sed reference](https://www.gnu.org/software/sed/manual/sed.html)
* [GNU awk reference](https://www.gnu.org/software/gawk/manual/gawk.html)
* [Deprecated Linux networking commands and their replacements](https://dougvitale.wordpress.com/2011/12/21/deprecated-linux-networking-commands-and-their-replacements)
