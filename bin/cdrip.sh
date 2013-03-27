#!/bin/bash

if [ ! -d "$1" ]; then
    echo "$1 is not a directory" >&2
    exit 1
fi

cd "$1"

cdparanoia -B

if [ $? -ne 0 ]; then 
    echo "Failed extracting CD" >&2
    exit 2
fi

for file in *.wav; do
    oggenc $file && rm $file
done

eject
