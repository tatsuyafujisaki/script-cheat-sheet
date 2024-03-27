# Note
* `-i` is to edit a file in-place instead of printing to standard output.
* `g` is to enable more than one replacement in each line.

# How to replace strings
```shell
sed "s/old/new/g" input.txt

# in-place (works only for sed of macOS)
sed -i '' "s/old/new/g" file.txt
```

# How to delete blank lines, including lines that contain only whitespace
```shell
sed -e '/^[[:blank:]]*$/d' input.txt

# in-place
sed -i -e '/^[[:blank:]]*$/d' file.txt
```

## How to delete blank lines, excluding lines that contain only whitespace
```shell
sed -e '/^$/d' input.txt

# in-place
sed -i -e '/^$/d' file.txt
```

# How to delete strings in a file
```shell
sed "s/unwanted//g" input.txt

# in-place
sed -i "s/unwanted//g" file.txt
```

# How to prefix lines
```shell
sed 's/^/prefix/' input.txt

# in-place
sed -i 's/^/prefix/' file.txt
```

# How to suffix lines
```shell
sed "s/$/suffix/" input.txt

# in-place
sed -i "s/$/suffix/" file.txt
```

# How to show 8 digits such as yyyymmdd
```shell
sed -e 's/.*\([[:digit:]]\{8\}\).*/\1/g' input.txt
```

# How to show double-slash comments
```shell
sed -e "s/.*\/\/[[:blank:]]*\([^[:blank:]]*\)[[:blank:]]*/\1/g" input.txt
```
