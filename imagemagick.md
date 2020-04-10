# How to resize an image to the width 320px
```shell
convert input.png -resize 320x output.png
```

# How to add a border of the width 8 to an image
```shell
convert input.png -border 8 output.png
```

# How to merge images horizontally (side by side)
```shell
convert *.png +append output.png

# Alternatively
convert input1.png input2.png input3.png +append output.png
```
