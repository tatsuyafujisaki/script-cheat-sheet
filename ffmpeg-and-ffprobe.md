# MP4 and WebM
## How to remove audio from MP4 or WebM
```shell
# -an is to remove audio.
ffmpeg -i input.mp4 -an output.mp4
```
```shell
ffmpeg -i input.webm -an output.webm
```

## How to convert WebM to MP4 or vice versa
```shell
ffmpeg -i input.webm output.mp4
```
```shell
ffmpeg -i input.mp4 output.webm
```
## How to rotate MP4 or WebM by 90 degrees clockwise
```shell
# -vf stands for video filter.
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4
```
```shell
ffmpeg -i input.webm -vf "transpose=1" output.webm
```

## How to create JPG from the specific second of MP4 or WebM
```shell
# creates JPG from the 5th second of MP4.
ffmpeg -i input.mp4 -ss 00:00:05 -vframes 1 output.jpg
```
```shell
ffmpeg -i input.webm -ss 00:00:05 -vframes 1 output.jpg
```

## How to create JPGs from each second of MP4 or WebM
```shell
ffmpeg -i input.mp4 -vf fps=1 output%02d.jpg
```
```shell
ffmpeg -i input.webm -vf fps=1 output%02d.jpg
```

## Bit rate
### How to find the bit rate of MP4 or WebM
1. Open MP4 in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Data Rate

### How to change the bit rate of MP4 or WebM
```shell
# Example of changing the birate to 1 Mbit/s (megabit per second)
ffmpeg -i input.mp4 -b:v 1m output.mp4
```

## Frame rate (FPS)
### How to find the frame rate (FPS) of MP4 or WebM
### Option 1
1. Open MP4 or WebM in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Encoded FPS
### Option 2
Use `ffprobe` and look for `fps` in the output.
```shell
ffprobe input.mp4
```
```shell
ffprobe input.webm
```

### How to change the frame rate (FPS) of MP4 or WebM
```shell
# Example of changing FPS to 30
ffmpeg -i input.mp4 -filter:v fps=30 output.mp4
```
```shell
ffmpeg -i input.webm -filter:v fps=30 output.webm
```

# M4A
## How to change the bitrate of M4A
```shell
# -q:a stands for quality:audio, which takes 0, 1, or 2.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -q:a 1 output.m4a
```

## How to change the sample rate of M4A
```shell
# -ar stands for audio sample rate in hertz.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -ar 44100 output.m4a
```
