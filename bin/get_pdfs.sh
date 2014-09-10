#!/bin/bash

cmd=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $cmd <url>" >&2
  exit 1
fi

url=$1
wget -r -l 1 -A.pdf "$url"
