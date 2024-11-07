# How to find the bit rate of MP4 or WebM
## MP4
### Option 1
```shell
ffprobe -loglevel error -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1 input.mp4
```
### Option 2
Run the following command and find `bitrate:`.
```shell
ffprobe input.mp4
```
### Option 3
1. Open MP4 in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Data Rate

## WebM
```shell
ffprobe -loglevel error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 input.webm
```

# How to change the bit rate of MP4 or WebM
```shell
# Example of changing the birate to 1 Mbit/s (megabit per second)
ffmpeg -y -i input.mp4 -b:v 1m output.mp4
```
