# Delete whitespace lines
sed -e '/^[[:blank:]]*$/d' input.txt

# Delete zero-length lines
sed -e '/^$/d' input.txt

# Extract double-slash comments
sed -e "s/.*\/\/[[:blank:]]*\([^[:blank:]]*\)[[:blank:]]*/\1/g" input.txt

# Extract 8 digits such as yyyymmdd
sed -e 's/.*\([[:digit:]]\{8\}\).*/\1/g' input.txt
