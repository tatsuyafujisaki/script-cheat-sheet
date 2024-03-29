# MP4
# How to remove audio from MP4
```shell
# -c:v stands for code:video.
# -an is to block audio.
ffmpeg -i input.mp4 -c:v copy -an output.mp4
```

# How to rotate MP4 by 90 degrees clockwise
```shell
# -vf stands for video filter.
ffmpeg -i input.mp4 -vf "transpose=1" output.mp4
```

# How to create JPG from the specific second of MP4
```shell
# creates JPG from the 5th second of MP4.
ffmpeg -i input.mov -ss 00:00:05 -vframes 1 output.jpg
```

# How to create JPGs from each second of MP4
```shell
ffmpeg -i input.mp4 -vf fps=1 output%02d.jpg
```

# M4A
# How to change the bitrate of M4A
```shell
# -q:a stands for quality:audio, which takes 0, 1, or 2.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -q:a 1 output.m4a
```

# How to change the sample rate of M4A
```shell
# -ar stands for audio sample rate in hertz.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -ar 44100 output.m4a
```
