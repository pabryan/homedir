#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: `basename $0` <filelist>" >&2
  exit 1
fi

files=$@
perl -pi -e 's/"([+-][0-9]*\.[0-9][0-9])"/\1/' $files
