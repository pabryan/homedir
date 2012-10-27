#!/bin/bash

dirs="${HOME}/org ${HOME}/Dropbox/${HOSTNAME}/homedir ${HOME}/working/ucsdwebsite"
for dir in ${dirs}; do
    echo $dir
    cd "${dir}"
    hg commit -m "automatic commit via cron at $HOSTNAME."
done

