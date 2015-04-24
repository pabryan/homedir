#!/bin/bash

# Make sure the agent is running
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval $(ssh-agent)
  grabsession
fi

# Only add if we don't already have a key
ssh-add -l > /dev/null 2>&1
if [ $? -ne 0 ]; then
    ssh-add 
    if [ $? -ne 0 ]; then
	exit 2    
    fi
fi
