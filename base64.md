## How to encode a string to Base64
```shell
base64 input.txt -o encoded.txt

# Alternatively
echo <plain-string> | base64
```

## How to decode Base64 to a string
```shell
base64 -d encoded.txt

# Alternatively
echo <encoded-string> | base64 --decode
```
