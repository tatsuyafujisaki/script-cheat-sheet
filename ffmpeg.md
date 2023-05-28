# How to change the bitrate of an m4a file.
```shell
# -q:a stands for quality:audio, which takes 0, 1, or 2.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -q:a 1 output.m4a
```

# How to change the sample rate of an m4a file.
```shell
# -ar stands for audio sample rate in hertz.
# https://trac.ffmpeg.org/wiki/Encode/AAC
ffmpeg -i input.m4a -ar 44100 output.m4a
```
