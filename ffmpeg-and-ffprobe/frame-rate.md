# How to find the frame rate (FPS) of MP4 or WebM
## Option 1
```shell
ffprobe -loglevel error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 input.mp4
```
## Option 2
Run the following command and find `fps`.
```shell
ffprobe input.mp4
```
## Option 3
1. Open MP4 or WebM in QuickTime Player
2. Menu bar > Window > Show Movie Inspector > Encoded FPS

# How to change the frame rate (FPS) of MP4 or WebM
```shell
# Example of changing FPS to 30
ffmpeg -y -i input.mp4 -vf fps=30 output.mp4
```
