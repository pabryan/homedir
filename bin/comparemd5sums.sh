#!/bin/bash

cmd=$(basename $0)

if [ $# -ne 2 ]; then
    echo "Usage: $cmd <md5file1> <md5file2>" >&2
    exit 1
fi

file1="$1"
file2="$2"


while read line; do
    md5sum=$(echo "$line" | awk '{print $1}')
    file=$(echo "$line" | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')

#'{for (i=2; i<=NF; i++) print $i}')

    grep "${md5sum}" "${file2}" > /dev/null
    if [ $? -ne 0 ]; then
	echo "'${file}' has non-mathching md5sum"
    fi
done < "${file1}"

