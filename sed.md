# How to delete whitespace lines
```shell
sed -e '/^[[:blank:]]*$/d' input.txt
```

# How to delete blank lines
```shell
sed -e '/^$/d' input.txt
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

# In-place
sed -i "s/old/new/g" input.txt
```

# How to extract 8 digits such as yyyymmdd
```shell
sed -e 's/.*\([[:digit:]]\{8\}\).*/\1/g' input.txt
```

# How to extract double-slash comments
```shell
sed -e "s/.*\/\/[[:blank:]]*\([^[:blank:]]*\)[[:blank:]]*/\1/g" input.txt
```
