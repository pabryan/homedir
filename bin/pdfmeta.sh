#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $(basename $0): <pdffile>" >&2
    exit 1
fi
file="$1"

# Extract meta data from pdf's
title=$(pdfinfo "$file" | awk '/^Title:/ {$1=""; print $0}')
author=$(pdfinfo "$file" | awk '/^Author:/ {$1=""; print $0}')

# Try searches
mrgetbib.sh "t=$title"
