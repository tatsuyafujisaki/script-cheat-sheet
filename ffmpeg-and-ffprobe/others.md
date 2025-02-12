# Common for various audio and video files.

## How to trim the duration of an audio or video file to 3661.001 seconds (= 1 hour + 1 minute + 1 seconds + 1 milliseconds)
```shell
ffmpeg -y -i input.mp4 -t 3661.001 output.mp4
```
```shell
ffmpeg -y -ss 00:00 -to 01:01:01.001 -i input.mp4 output.mp4
```
https://ffmpeg.org/ffmpeg-utils.html#toc-Time-duration

# MP4 and WebM
## How to downsize `.mp4` or `.webm` by optimizing the bit rate
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

