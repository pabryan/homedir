#!/bin/bash

formula="${1}"
out="${2}"

formula='$f(x,y) = e^x$'
out="q3_a4"

head="\documentclass[border=2pt,varwidth]{standalone}
\usepackage{standalone}
\usepackage{amsmath}
\usepackage[all]{pabmacros}
\begin{document}"
foot="\end{document}"
echo "${head} ${formula} ${foot}" > "$HOME/tmp/formula.tex"
pdflatex "\input{$HOME/tmp/formula.tex}"
convert -density 150 formula.pdf -quality 90 $out.png
