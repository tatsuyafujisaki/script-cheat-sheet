# What does `sips` stand for?
Scriptable Image Processing System

# How to show the width and height of an image
```shell
sips -g sips -g pixelWidth -g pixelHeight input.png
```

# How to resize the width of an image
```shell
sips --resampleWidth 1024 input.png
```

# How to convert a PDF to a PNG
```shell
sips -s format png input.pdf --out output.png
```
