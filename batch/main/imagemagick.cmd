@echo off

rem Convert png to ico
magick.exe foo.png foo.ico

rem Horizontally merge two images
magick.exe convert +append left.jpg right.jpg result.jpg

rem Vertically merge two images
magick.exe convert -append top.jpg bottom.jpg result.jpg

rem Merge three images
magick.exe convert +append upper-left.jpg upper-right.jpg temp.jpg
magick.exe convert -append temp.jpg lower-left.jpg result.jpg