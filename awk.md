# Note
* `OFS` is ignored when using `{ print }` instead of `{ print $1,$2,$3... }`.

# How to trim leading and trailing whitespace in each line
```shell
gawk '{$1=$1};1' input.txt

# in-place
gawk -i inplace '{$1=$1};1' file.txt
```

# How to show lines that contains a substring
```shell
# The following shows:
# apple
# pineapple
echo "apple\norange\npineapple" | awk '/apple/ { print $0 }'
```

# How to get the last element
```shell
echo aa,bb,cc | awk -F, '{print $NF}' # cc
```
