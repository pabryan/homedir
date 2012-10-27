#!/bin/bash

dirs="~/org ~/Dropbox/${HOSTNAME}/homedir ~/working/ucsdwebsite"
for dir in $dirs; do
    echo $dir
done

cd ~/org
hg commit -m "automatic commit via cron at $HOSTNAME."

cd ~/Dropbox/$HOSTNAME/homedir
hg commit -m "automatic commit via cron at $HOSTNAME."

cd ~/working/ucsdwebsite
hg commit -m "automatic commit via cron at $HOSTNAME."

