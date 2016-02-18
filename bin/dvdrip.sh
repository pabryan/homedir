#!/bin/bash

#vobcopy -m

for file in *.VOB; do
    name=$(basename -s '.VOB' ${file})
    avconv -i ${file} -vcodec mpeg4 -q 1 -strict experimental ${name}.mp4
done
