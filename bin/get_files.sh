#!/bin/bash

cmd=`basename $0`
if [ $# -ne 2 ]; then
  echo "Usage: $cmd <url> <ext>" >&2
  exit 1
fi

url=$1
ext=$2
wget -d -r -l 1 -A.$ext "$url"
