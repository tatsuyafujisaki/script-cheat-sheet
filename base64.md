## How to encode a string in base64
```shell
base64 input.txt -o encoded.txt

# Alternatively
echo <plain-string> | base64
```

## How to decode a string in base64
```shell
base64 -d encoded.txt

# Alternatively
echo <encoded-string> | base64 -d
```
