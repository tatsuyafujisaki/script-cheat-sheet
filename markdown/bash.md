# How to use `join`
* `-t` is a separator
* `-1` is the one-based index of a matching column from a first input file.
* `-2` is the one-based index of a matching column from a second input file.
```bash
$ cat foo.txt
aaa,1,xxx
bbb,2,yyy
ccc,3,zzz

$ cat bar.txt
1,AAA,XXX
2,BBB,YYY
3,CCC,ZZZ

$ join -t, -1 2 -2 1 foo.txt bar.txt
1,aaa,xxx,AAA,XXX
2,bbb,yyy,BBB,YYY
3,ccc,zzz,CCC,ZZZ
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
```bash
$ gtime -f '%e' cat /bin/sh | xxd -g1 > /dev/null
0.03

$ gtime -f '%e' cat /bin/sh | hexdump -C > /dev/null
0.17

$ gtime -f '%e' cat /bin/sh | od -Ax -tx1 > /dev/null
0.07
```

# References
## tldp.org
* [bash reference](http://tldp.org/LDP/abs/html/refcards.html)
* [arrays](http://tldp.org/LDP/abs/html/arrays.html)

## gnu.org
* [awk](https://www.gnu.org/software/gawk/manual/gawk.html)
* [sed](https://www.gnu.org/software/sed/manual/sed.html)

## Others
[Deprecated Linux networking commands and their replacements](https://dougvitale.wordpress.com/2011/12/21/deprecated-linux-networking-commands-and-their-replacements)
