## How to check if `${s}` matches `${regex}`
```shell
## '=~' is to enable regex in 'if' statement. http://tldp.org/LDP/abs/html/special-chars.html
[[ ${s} =~ ${regex} ]] && echo "matched" || echo "unmatched"
```

## How to check if `${digits}` is digits.
```shell
[[ ${digits} =~ ^[[:digit:]]+$ ]] && echo "matched" || echo "unmatched"
```
