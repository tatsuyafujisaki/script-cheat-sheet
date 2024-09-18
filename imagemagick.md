# How to resize the width of an image
```shell
magick input.png -resize 320x output.png
```

# How to add a red border of 4px width to an image
```shell
magick input.png -bordercolor "#ff000000" -border 4 output.png
```

# How to convert transparency to white
```shell
magick input.png -flatten output.png
```

# How to convert an image to grayscale
```shell
magick input.png -type grayscale output.png
```

# How to convert a PDF to an image
```
magick -density 600 input.pdf -type grayscale output.png
```

# How to merge images horizontally (side by side)
```shell
# "-gravity center" vertically center input images.
magick input1.png input2.png input3.png -gravity center +append output.png
```

# How to split a long image into A4 PDFs
```shell
# 2480px is the width of the A4 paper size when the PPI (pixels per inch) is 300.
# 3508px is the height of the A4 paper size when the PPI (pixels per inch) is 300.
# https://imagemagick.org/script/command-line-processing.php#geometry
magick input.png -resize 2480 -crop 2480x3508 +repage output.pdf
```
