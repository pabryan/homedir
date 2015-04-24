#!/bin/bash

grabsession
. ssh_add_key.sh
ssh_control_master.sh "hg@bitbucket.org"
screen -xRR

