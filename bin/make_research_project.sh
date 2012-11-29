#!/bin/bash

script=$(basename "$0")

if [ $# -ne 1 ]; then
    echo "Usage: $script <projname>" >&2
    exit 1
fi

proj="$1"
basedir="$HOME/working/academic/research"
projdir="${basedir}/${proj}"

mkdir "${projdir}"
if [ $? -ne 0 ]; then
    echo "${script}: Cannot create directory ${projdir}" >&2
    exit 1
fi

cd "${projdir}"

# Default file
cat <<EOF > "${proj}.org"
* Notes

EOF

# Create local repository
hg init || exit 2
hg add || exit 2
hg commit -m "Initial repository" || exit 2

# Create bitbucket repsitory
create_bitbucket.py -u pabryan "${proj}" || exit 2

# Set hg default path to bitbucket repo
cat <<EOF > .hg/hgrc
[paths]
default = ssh://hg@bitbucket.org/pabryan/${proj}

EOF

# Push repo to bitbucket
hg push || exit 2
