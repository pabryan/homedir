#!/bin/bash

grabsession
. ssh_add_key.sh
ssh_control_master.sh "hg@bitbucket.org"
screen -xRR

# list windows
# screen -S $screen_name -Q windows
# create emacs
# screen -S $screen_name -X screen -t emacs emacsclient -nw -c
