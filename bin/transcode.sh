#!/bin/bash

input="$1"
format="mp4"

#extension="${input##*.}"
output="${input%.*}.${format}"

#Transcode
ffmpeg -i "$input" -s 640x480 -vcodec mpeg4 -b 512k -acodec libvo_aacenc -ac 1 -ar 16000 -r 30 -ab 32000 -aspect 3:2 "$output"

# Show details
#mplayer -vo null -ao null -identify -frames 0 $output | less