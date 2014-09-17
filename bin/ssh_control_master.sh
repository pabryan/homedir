#!/bin/bash

script=$(basename $0)

if [ $# -ne 1 ]; then
    echo "Usage: ${script} <host>" >&2
    exit 1
fi

remote="$1"
socket="$HOME/tmp/sockets/${remote}:22"

# Only start if control master is not already active
ssh -O check -S "${socket}" "${remote}"
if [ $? -ne 0 ]; then
    rm "${socket}" 
    ssh -Nf -M -S "${socket}" "${remote}"
fi

