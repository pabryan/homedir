#!/bin/bash

in="$1"
name=$(basename "$in" .m4v)
out="${name}.mp3"

echo $in
echo $out

ffmpeg -i "$in" -f mp3 "$out"