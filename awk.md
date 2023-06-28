# Note
`OFS` (Output Field Separator) is ignored when using `{ print }` instead of `{ print $1,$2,$3... }`.

# How to trim leading and trailing whitespace in each line
```shell
awk '{$1=$1};1' input.txt
```

# How to show lines that contains a substring
```shell
# The following shows:
# apple
# pineapple
echo "apple\norange\npineapple" | awk '/apple/ { print $0 }'
```

# How to show the last column
```shell
awk -F, '{print $NF}' input.txt
```
