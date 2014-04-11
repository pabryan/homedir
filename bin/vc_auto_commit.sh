#!/bin/bash

# First ensure we have ssh identities in the agent
. $HOME/session/updatesession # make sure we have current environment
ssh-add 
if [ $? -ne 0 ]; then
    exit 2    
fi

dirs="${HOME}/org ${HOME}/Dropbox/${HOSTNAME}/homedir"

for dir in ${dirs}; do
    cd "${dir}"
    hg autosync -o
done


