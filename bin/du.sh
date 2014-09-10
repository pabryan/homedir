#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: du <dir>" >&2
    exit 2
fi

du "${1}" | sort -nr | less
