#!/bin/bash


# First ensure we have ssh identities in the agent
. $HOME/session/updatesession # make sure we have current environment
ssh-add -l > /dev/null 2>&1
if [ $? -ne 0 ]; then
    ssh-add 
    if [ $? -ne 0 ]; then
	exit 2    
    fi
fi

# Set up a multiplexed connection
ssh_control_master.sh "hg@bitbucket.org"

# Mercurial controlled projects
working="${HOME}/working"
cd $working
projs=$(find . -iname '.hg')

# Strip trailing .hg
for proj in ${projs}; do
  proj="${proj%.hg}"
  cd $proj
#  echo "*********************************************"
#  echo "Checking ${proj}"
#  echo "---------------------------------------------"
  

  hg summary | grep -q 'commit: (clean)'
  if [ $? -ne 0 ]; then
      echo "${proj} has uncommitted changes"
  fi

  hg incoming >/dev/null
  retval=$?
  if [ $retval -eq 255 ]; then
      echo "${proj} has no default repository" >&2
      cd $working
      continue
  fi

  if [ $retval -eq 0 ]; then
      echo "${proj} has incoming changes"
  fi

  hg outgoing >/dev/null
  if [ $? -eq 0 ]; then
      echo "${proj} has outgoing changes"
  fi

  cd $working
done

