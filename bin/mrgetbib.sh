#!/bin/bash

outbibfile="$HOME/research_resources/okaypapers/refs.bib"

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

# Don't do anything if already in bib file
in_bib "$id" && exit 0

echo "$ref" >> "$outbibfile"
exit 0

echo "$ref"

while true; do
    read -p "Accept [y/n]? " -n1 ans
    echo ""
    case "$ans" in
	y|Y) acc=1; break ;;
	n|N) acc=0; break ;;
	*) echo "Please respond y/n" ;;
    esac
done

if [ $acc -eq 1 ]; then
    echo "$ref" >> $bibfile
    exit 0
else
    exit 1
fi
