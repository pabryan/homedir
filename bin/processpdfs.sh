#!/bin/bash

processdir=~/research_resources/unprocessed_papers/
papersdir=~/research_resources/okaypapers/

for file in $processdir/*.pdf; do
    # handle spaces in file name
    filename=$(basename "$file")
    # Check if this is already in papers
    if [ -f "$papersdir/$filename" ]; then
	continue
    fi

    # Extract meta data from pdf's
    title=$(pdfinfo "$file" | awk '/^Title:/ {$1=""; print $0}')

    # Try to get mathscinet ref
    mrid=$(mrgetid.sh "t=$title")
    if [ -n "$mrid" ]; then
	mrgetbib.sh "r=$mrid" && mv "$file" "$papersdir/${mrid}_${filename}.pdf"
    fi
done

