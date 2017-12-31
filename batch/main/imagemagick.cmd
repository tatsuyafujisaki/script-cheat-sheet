@echo off

title %~df0

rem Convert png to ico
magick foo.png foo.ico

rem Horizontally merge two images
magick convert +append left.jpg right.jpg result.jpg

rem Vertically merge two images
magick convert -append top.jpg bottom.jpg result.jpg

rem Merge three images
magick convert +append upper-left.jpg upper-right.jpg temp.jpg
magick convert -append temp.jpg lower-left.jpg result.jpg
