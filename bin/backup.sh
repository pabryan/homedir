#!/bin/bash

local=${HOME}
remote=gan.anu.edu.au:~/backup/sandman/
filelist=${HOME}/mutable/backup/files

rsync -arze ssh --files-from ${filelist} ${local} ${remote}

#basedir=$HOME
#backupdir=$HOME/backup
#backup=uni
#file=$backupdir/`basename $backup`.`date '+%F'`.tgz
#remote=gan.anu.edu.au:~/backup/
#exclude="$backupdir/exclude"

#if [ ! -f $file ]; then
#  tar -X $exclude -C $basedir -czf $file $backup
#fi
#rsync -avze ssh $file $remote
#scp $file $remote
