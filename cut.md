# How to get a string between double quotation marks
```shell
# -d is a delimiter.
# -f is to extract a second field.
# -s is to skip lines that do not have the delimiter.
cut -d '"' -f2 -s input.txt
```
# How to exclude a specific column
```shell
# -f is to extract a field.
cut -f2 --complement input.txt
```
