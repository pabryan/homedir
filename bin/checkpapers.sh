#!/bin/bash

papersdir="$HOME/research_resources/papers"
processdir="$HOME/research_resources/unprocessed_papers"
bibfile="$HOME/org/refs.bib"
orgfile="$HOME/org/refs.org"

# Output incosisntent id's to files
outdir="$HOME/tmp"
orgout="$outdir/org.out"
bibout="$outdir/bib.out"
dirout="$outdir/dir.out"
# Clear output files
> $orgout
> $bibout
> $dirout

# Load bibtex library
. ~/bin/bibfuncs.sh

# Check if files in papers dir have corresponding bib and org entries
for file in $papersdir/*; do
    filename=$(basename "$file")
    ext="${filename##*.}"
    id="${filename%.*}"

    if [ "$ext" != "pdf" ]; then
	echo "$filename" is not a pdf! >&2
    fi    

    in_bib "$id" || mrgetbib.sh -r $id 
    in_org "$id" || echo "$id" >> $orgout
done

# Check if entries in bib file have corresponding org and dir entries
for id in $(bibtex2html -q --print-keys $bibfile); do
    if ! in_dir $id; then
	# The paper may be in the processing folder
	if ! mv $processdir/$id.pdf $papersdir 2>/dev/null; then
	    echo "$id" >> $dirout
	fi
    fi
    in_org "$id" || echo "$id" >> $orgout
done

# Check if entries in org file have corresponding bib and dir entries
for id in $(awk '/^[[:space:]]*:Custom_ID:[[:space:]]*(.*)/ {print $2}' "$orgfile"); do
    if ! in_dir $id; then
	# The paper may be in the processing folder
	if ! mv $processdir/$id.pdf $papersdir 2>/dev/null; then
	    echo "$id" >> $dirout	    
	fi
    fi
    in_bib $id || mrgetbib.sh -r $id 
done
