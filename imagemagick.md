# How to resize an image to the width 320px
```shell
convert -resize 320x input.png output.png
```
# How to concatenate images side by side
```shell
convert +append *.png output.png

# Alternatively
convert +append input1.png input2.png input3.png output.png
```
