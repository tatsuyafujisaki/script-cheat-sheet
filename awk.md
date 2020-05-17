# Note
* `OFS` is ignored when using `{ print }` instead of `{ print $1,$2,$3... }`.

# How to trim leading and trailing whitespace in each line
```shell
gawk '{$1=$1};1' < input.txt > output.txt

# in-place
gawk '{$1=$1};1' file.txt
```

# How to show the first, second, and third fields if the second field is foo or bar
```shell
awk -F',' '($2 == "foo") || ($2 == "bar") { OFS=","; print $1,$2,$3 }' input.txt
```
