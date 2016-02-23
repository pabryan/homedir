#!/bin/bash

basedir=${PWD}

#vobcopy -m

dirs=$(ls ${basedir})
for dir in ${dirs}; do
    cd ${dir}/VIDEO_TS || continue
    for file in *.VOB; do
	name=$(basename -s '.VOB' ${file})
	nice -n 19 avconv -i ${file} -vcodec mpeg4 -q 1 -strict experimental ${name}.mp4
    done
    cd ${basedir}
done

