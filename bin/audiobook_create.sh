#!/bin/bash

if [ ! -d "$1" ]; then
    echo "$1 is not a directory" >&2
    exit 1
fi

cd "$1"

num=$2
re='^[0-9]+$'
if ! [[ $num =~ $re ]] ; then
    echo "$num is not a number" >&2
    exit 1
fi

for i in $(seq $num); do
    # append 0 if necessary
    if [ ${#i} -eq 1 ]; then
	i="0${i}"
    fi
    mkdir "disc${i}"
done
