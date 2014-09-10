#!/bin/bash

afuse -o mount_template="sshfs %r:/ %m" \
    -o unmount_template="fusermount -u -z %m" \
    $HOME/mnt/
