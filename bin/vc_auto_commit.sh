#!/bin/bash

# make sure we have current environment
. $HOME/session/updatesession 

# ssh host key
ssh_add_key.sh

# Set up a multiplexed connection
ssh_control_master.sh "hg@bitbucket.org"

dirs="${HOME}/org ${HOME}/Dropbox/${HOSTNAME}/homedir"

for dir in ${dirs}; do
    cd "${dir}"
    hg autosync -o
done

