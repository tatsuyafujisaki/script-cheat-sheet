## How to change the vertical resolution of MP4
```shell
# `-vf scale=-1:144` is the video filter option where `scale` is used to change the resolution. By setting the width to `-1`, FFmpeg automatically calculates the width while maintaining the original aspect ratio, and sets the height to 144 pixels.
ffmpeg -y -i input.mp4 -vf scale=-1:144 output.mp4
```
