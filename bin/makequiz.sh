#!/bin/bash

file="$1"
out=quiz06ans_05_b
line='$\frac{\partial f}{\partial x} \frac{\partial x}{\partial r} + \frac{\partial f}{\partial y} \frac{\partial y}{\partial r}$'

#while read line; do
    tex2png.sh "${line}" "${out}"
#done < $file
