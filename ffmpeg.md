# MP4
## How to remove audio from MP4
```shell
# -an is to remove audio.
ffmpeg -i input.mp4 -an output.mp4
```

## How to convert WebM to MP4
```shell
ffmpeg -i input.webm output.mp4
```

## How to rotate MP4 by 90 degrees clockwise
```shell
# -vf stands for video filter.
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4
```

## How to create JPG from the specific second of MP4
```shell
# creates JPG from the 5th second of MP4.
ffmpeg -i input.mov -ss 00:00:05 -vframes 1 output.jpg
```

## How to create JPGs from each second of MP4
```shell
ffmpeg -i input.mp4 -vf fps=1 output%02d.jpg
```

## Frame rate (FPS)
### How to know the frame rate (FPS) of MP4
1. Open MP4 in QuickTime Player
2. Menu bar > Window > Show Movie Inspector

### How to change the frame rate (FPS) of MP4
```
# Example of changing fps to 30
ffmpeg -i input.mp4 -filter:v fps=30 output.mp4
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
