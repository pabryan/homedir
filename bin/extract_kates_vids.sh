#!/bin/bash

for dir in *; do
    cd $dir
    for file in *; do
	tar -xf $file
    done
    cd ..
done

