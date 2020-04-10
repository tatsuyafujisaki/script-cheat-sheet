# How to resize an image to the width 320px
```shell
convert -resize 320x input.png output.png
```

# How to add a black border of the width 8x8 to an image
```shell
convert input.png -border 8 -bordercolor black output.png
```

# How to merge images horizontally (side by side)
```shell
convert +append *.png output.png

# Alternatively
convert +append input1.png input2.png input3.png output.png
```
