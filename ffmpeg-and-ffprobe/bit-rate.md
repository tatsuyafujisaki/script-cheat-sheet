# How to find the bit rate of MP4
## Option 1
```shell
ffprobe -loglevel error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1 input.mp4
```
## Option 2
Run the following command and find `bitrate:`.
```shell
ffprobe input.mp4
```
## Option 3
1. Open MP4 in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Data Rate

# How to find the bit rate of WebM
```shell
ffprobe -loglevel error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 input.webm
```
