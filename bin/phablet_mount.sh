#!/bin/bash

target="/home/phablet/${1}"

if [ ! -d "${target}" ]; then
    echo "${target} does not exist"
    exit 1
fi

dirs="/proc /dev /sys /run/shm /tmp /var/lib/dbus /run/dbus /run/user/32011 /dev/pts"

for dir in ${dirs}; do
   [ -d "${target}/${dir}" ] || sudo mkdir -p "${target}/${dir}" || exit 2
   sudo mount --bind "${dir}" "${target}/${dir}"
done

sudo cp /etc/resolv.conf "${target}"/etc/resolv.conf

