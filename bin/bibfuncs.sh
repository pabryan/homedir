#!/bin/bash

papersdir="$HOME/research_resources/papers"
bibfile="$HOME/org/refs.bib"
orgfile="$HOME~/org/refs.org"

# Check for item in directory
in_dir () {
  [[ -f $papersdir/$1.pdf ]]
}

# Check for item in bib file
in_bib () {
    # bibtool complains if we do an empty search
    if [ -z "$1" ]; then
	return 1
    fi

    # bibtool searches for id only in the key field
    if [[ -n $(bibtool -- 'select{$key "'"$1"'"}' "$bibfile") ]]; then
	return 0
    else
	return 1
    fi
}

# Check for item in org file
in_org () {
    # grep will match if arg is empty
    if [ -z "$1" ]; then
	return 1
    fi
    # Find our entry in the Custom_ID field
    grep -q "^[[:space:]]*:Custom_ID: $1" "$orgfile"
}
