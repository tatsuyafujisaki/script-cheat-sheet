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
