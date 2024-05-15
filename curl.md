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

# How to download a file to a specific directory
```bash
cd <dir> && { curl -O https://example.com/sample.txt; cd -; }

# Alternatively using a subshell. (A parenthesized command runs in a subshell.)
(cd <dir> && curl -O https://example.com/sample.txt )
```

# How to download a file and change the file name.
```bash
curl -o my-favorite-name.txt https://example.com/sample.txt
```

# How to PUT a file to a URL
```shell
curl -T sample.jpg https://example.com
```

# How to POST JSON to a URL (How to send a message of Firebase Cloud Messaging (FCM))
```shell
curl 'https://fcm.googleapis.com/fcm/send' \
--header 'Content-Type: application/json' \
--header 'Authorization: key=<server key a.k.a. API key>' \
--data-raw '{
  "priority": 2,
  "registration_ids": [
    "<firebase token>"
  ],
  "data": {
    "foo": "<fill me>",
    "bar": "<fill me>",
  },
  "notification": {
    "title": "<fill me>",
    "body": "<fill me>",
    "click_action": "<fill me>"
  }
}'
```

# How to compress PNG or JPG using TinyPNG/TinyJPG
```shell
curl -i -u api:<api-key> --data-binary @input.png https://api.tinify.com/shrink
```

# References
https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods
