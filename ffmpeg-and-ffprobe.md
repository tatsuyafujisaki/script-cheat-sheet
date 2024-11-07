# Note
## `-y`
> `-y`<br>
> Overwrite output files without asking.

https://ffmpeg.org/ffmpeg.html#toc-Main-options

## `-filter:v` and `-vf`
> `-vf`<br>
> This is an alias for `-filter:v`

https://ffmpeg.org/ffmpeg.html#toc-Video-Options

## `-frames:v` and `-vframes`
> `-vframes`<br>
> This is an obsolete alias for `-frames:v`, which you should use instead.

https://ffmpeg.org/ffmpeg.html#toc-Video-Options

# MP4 and WebM
## How to optimize (downsize) `.mp4` or `.webm`
```shell
ffmpeg -y -i input.mp4 output.mp4
```

## How to remove audio from `.mp4` or `.webm`
```shell
# -an is to remove audio.
ffmpeg -y -i input.mp4 -an output.mp4
```

## How to convert `.mp4` to `.webm` or vice versa
```shell
ffmpeg -y -i input.mp4 output.webm
```

## How to rotate `.mp4` to `.webm` by 90 degrees clockwise
```shell
# -vf stands for video filter.
ffmpeg -y -i input.mp4 -vf "transpose=1" output.mp4
```

## How to create `.jpg` from the specific second of `.mp4` to `.webm`
```shell
# creates JPG from the 5th second of MP4.
ffmpeg -y -i input.mp4 -ss 00:00:05 -frames:v 1 output.jpg
```

## How to create `.jpg`s from each second of `.mp4` to `.webm`
```shell
ffmpeg -y -i input.mp4 -vf fps=1 output%02d.jpg
```

## How to trim `.mp4` to 5 minutes
```shell
ffmpeg -y -i input.mp4 -t 300 output.mp4
```
```shell
ffmpeg -y -ss 00:00:00 -to 00:05:00 -i input.mp4 output.mp4
```

## Bit rate
### How to find the bit rate of MP4 or WebM
1. Open MP4 in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Data Rate

### How to change the bit rate of MP4 or WebM
```shell
# Example of changing the birate to 1 Mbit/s (megabit per second)
ffmpeg -y -i input.mp4 -b:v 1m output.mp4
```

## Frame rate (FPS)
### How to find the frame rate (FPS) of MP4 or WebM
#### Option 1
1. Open MP4 or WebM in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Encoded FPS
#### Option 2
Run the following command and find "\<number> fps" in the output.
```shell
ffprobe input.mp4
```
```shell
ffprobe input.webm
```

### How to determine if MP4 or WebM has a variable frame rate (VFR)
Run the following command and find "VFR:\<number>" in the output.
```shell
ffmpeg -i input.mp4 -vf vfrdet -an -f null -
```
```shell
ffmpeg -i input.webm -vf vfrdet -an -f null -
```

### How to change the frame rate (FPS) of MP4 or WebM
```shell
# Example of changing FPS to 30
ffmpeg -y -i input.mp4 -vf fps=30 output.mp4
```

# M4A
## How to change the bitrate of M4A
```shell
# -q:a stands for quality:audio, which takes 0, 1, or 2.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -y -i input.m4a -q:a 1 output.m4a
```

## How to change the sample rate of M4A
```shell
# -ar stands for audio sample rate in hertz.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -y -i input.m4a -ar 44100 output.m4a
```
