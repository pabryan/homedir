#!/bin/bash

dirs="${HOME}/org ${HOME}/Dropbox/${HOSTNAME}/homedir"

for dir in ${dirs}; do
    cd "${dir}"
    hg autosync -o
done

