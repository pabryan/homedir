#!/bin/bash

ver=$1

rm final_defn.tex
ln -s final_defn${ver}.tex final_defn.tex
pdflatex final.tex
mv final.pdf final${ver}.pdf
