#!/bin/bash

# First ensure we have ssh identities in the agent
. $HOME/session/updatesession # make sure we have current environment
ssh-add -l > /dev/null 2>&1
if [ $? -ne 0 ]; then
    ssh-add 
    if [ $? -ne 0 ]; then
	exit 2    
    fi
fi

# Set up a multiplexed connection
ssh_control_master.sh "hg@bitbucket.org"

dirs="${HOME}/org ${HOME}/Dropbox/${HOSTNAME}/homedir"

for dir in ${dirs}; do
    cd "${dir}"
    hg autosync -o
done

