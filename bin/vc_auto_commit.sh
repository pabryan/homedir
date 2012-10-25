#!/bin/bash
cd ~/org
hg commit -m "automatic commit via cron at $HOSTNAME."

cd ~/Dropbox/office/homedir
hg commit -m "automatic commit via cron at $HOSTNAME."

cd ~/Dropbox/office/working/ucsdwebsite
hg commit -m "automatic commit via cron at $HOSTNAME."