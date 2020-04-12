# How to remove leading and trailing white spaces
```shell
echo ' foo ' | awk '{$1=$1};1'
```

# How to show the first, second, and third fields if the second field is foo or bar
```shell
awk -F',' '($2 == "foo") || ($2 == "bar") { OFS=","; print $1,$2,$3 }' input.txt
```

# Note
* OFS is ignored when using { print } instead of { print $1,$2,$3... }.
