#!/bin/bash

script=$(basename "$0")

if [ $? -ne 1 ]; then
    echo "Usage: ${script} <proj>" >&2
    exit 1
fi

proj="$1"

hg clone "ssh://hg@bitbucket.org/pabryan/${proj}"
