#!/bin/bash

cmd=$(basename $0)

if [ $# -ne 2 ]; then
    echo "Usage: $cmd <md5file1> <md5file2>" >&2
    exit 1
fi

file1="$1"
file2="$2"

while read line; do
    md5sum=${line:[1]}
    file=${line:2}

    echo $md5sum
    echo $line
    exit
done < "${file1}"

