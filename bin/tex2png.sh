#!/bin/bash

formula="${1}"
out="${2}"

formula='True of false? The following function is piecewise continuous?
   \[
   f(t) = \begin{cases}
   0, & t\leq 0 \\
   1/t, & t>0
   \end{cases}
   \]'
out="q1"

head="\documentclass[border=2pt,varwidth]{standalone}
\usepackage{standalone}
\usepackage{amsmath}
\usepackage[all]{pabmacros}
\begin{document}"
foot="\end{document}"
echo "${head} ${formula} ${foot}" > "$HOME/tmp/formula.tex"
pdflatex "\input{$HOME/tmp/formula.tex}"
convert -density 150 formula.pdf -quality 90 $out.png
