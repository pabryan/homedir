#!/bin/bash

grabsession
. ssh_add_key.sh
#ssh_control_master.sh "hg@bitbucket.org"

screen_name="pabscreen"

# If screen is running, then start emacs if not already running
screen -S pabscreen -Q windows
if [ $? -eq 0 ]; then
    # Start emacs if not already running
    screen -S ${screen_name} -Q windows | grep 'emacs' > /dev/null
    if [ $? -ne 0 ]; then
        echo "emacs"
        screen -S $screen_name -X screen -t emacs emacsclient -nw -c
    fi
fi

# Attach to screen
screen -S ${screen_name} -xRR

