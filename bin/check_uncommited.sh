#!/bin/bash

working="${HOME}/working"

cd $working
# Mercurial controlled projects
projs=$(find . -iname '.hg')

# Strip trailing .hg
for proj in ${projs}; do
  proj="${proj%.hg}"
  cd $proj
#  echo "*********************************************"
  echo "Checking ${proj}"
  echo "---------------------------------------------"
  

  hg summary | grep -q 'commit: (clean)'
  if [ $? -ne 0 ]; then
      echo "${proj} has uncommitted changes"
  fi

  hg incoming >/dev/null
  if [ $? -eq 0 ]; then
      echo "${proj} has incoming changes"
  fi

  hg outgoing >/dev/null
  if [ $? -eq 0 ]; then
      echo "${proj} has outgoing changes"
  fi

  cd $working
done
