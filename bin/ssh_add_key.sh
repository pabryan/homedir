#!/bin/bash

ssh-add -l > /dev/null 2>&1

if [ $? -ne 0 ]; then
    ssh-add 
    if [ $? -ne 0 ]; then
	exit 2    
    fi
fi
