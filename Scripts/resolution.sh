#!/bin/bash

#Add the 1920*1080 resolution to the second monitor
#More info in notes.md

cvt 1920 1080
xrandr --newmode "1920x1080_60.00" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync
xrandr --addmode DP-2 "1920x1080_60.00"
xrandr --output DP-2 --mode "1920x1080_60.00"


cvt 2560 1440
xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --addmode DP-2 "2560x1440_60.00"
xrandr --output DP-2 --mode "2560x1440_60.00"


#cvt  3840 2160
#cvt 5120 2880
#cvt 7680 4320


