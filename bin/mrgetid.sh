#!/bin/bash

bibfile=~/org/refs.bib

. ~/bin/bibfuncs.sh

# Get MR bibtex record
ref=$(bibget.sh "$@")
if [ -z "$ref" ]; then
    echo "Entry not found!" >&2
    exit 1
fi

# Extract ID
id=$(echo "$ref" | bibtex2html -q --print-keys)
if [ -z "$id" ]; then
    echo "Error extracting key!" >&2
    exit 1
fi

echo "$id"
