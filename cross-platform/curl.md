# Options
## `--create-dirs`
Create local directories if necessary

## `-f`
Not print error HTMLs returned from failing HTTP servers

## `-L`
Follow redirections

# How to use the HTTP HEAD method
```bash
curl --head https://example.com
```

# How to use the HTTP TRACE method
```bash
curl -i -X TRACE https://example.com
```

# How to use the HTTP OPTIONS method. Without -i, nothing will be printed.
```bash
curl -i -X OPTIONS https://example.com
```

# How to print http_code
```bash
curl -s -o /dev/null -w "%{http_code}\n" https://example.com
```

# References
https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods