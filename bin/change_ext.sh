#!/bin/bash

in="$1"
oldext="$2"
newext="$3"

name=$(basename "$in" ".$oldext")
out="${name}.${newext}"

mv "$in" "$out"