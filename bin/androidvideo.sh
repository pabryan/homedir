#!/bin/bash

file=$1
name=$(basename -s '.VOB' ${file})


nice -n 19 avconv -i ${file} -s 400x320 -vcodec mpeg4 -strict experimental -acodec aac -ac 1 -ar 16000 -ab 32000 ${name}_android.mp4

#mencoder $in -o ${out}.mp4 -oac pcm -ovc lavc -lavcopts vcodec=mpeg1video -of mpeg

#mencoder $file -o $out.mp4 \
#  -vf dsize=480:352:2,scale=-8:-8,harddup \
#  -oac faac -faacopts mpeg=4:object=2:raw:br=128 \
#  -of lavf -lavfopts format=mp4 -ovc x264 -sws 9 \
#  -x264encopts nocabac:level_idc=30:bframes=0:bitrate=512:threads=auto:turbo=1:global_header:threads=auto:subq=5:frameref=6:partitions=all:trellis=1:chroma_me:me=u

#ffmpeg -i source-video.avi   -r 13  -aspect 3:2 output-video.mp4


