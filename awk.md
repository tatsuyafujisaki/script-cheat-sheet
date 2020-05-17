# How to trim leading and trailing whitespaces
```shell
awk '{$1=$1};1' < input.txt > output.txt
```

# How to show the first, second, and third fields if the second field is foo or bar
```shell
awk -F',' '($2 == "foo") || ($2 == "bar") { OFS=","; print $1,$2,$3 }' input.txt
```

# Note
* OFS is ignored when using { print } instead of { print $1,$2,$3... }.
