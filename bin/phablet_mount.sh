#!/bin/bash

target="/home/phablet/${1}"

if [ ! -f "${target}" ]; then
    echo "${target} does not exist"
    exit 1
fi


sudo mount --bind /proc "${target}"/proc
sudo mount --bind /dev "${target}"/dev
sudo mount --bind /sys "${target}"/sys
sudo mount --bind /run/shm "${target}"/run/shm
sudo mount --bind /tmp "${target}"/tmp
sudo mount --bind /var/lib/dbus "${target}"/var/lib/dbus
sudo mount --bind /run/dbus "${target}"/run/dbus
sudo mount --bind /run/user/32011 "${target}"/run/user/32011
sudo mount --bind /dev/pts "${target}"/dev/pts
