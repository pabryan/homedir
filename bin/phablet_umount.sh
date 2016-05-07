while read line; do sudo umount $(echo $line | cut -d " " -f3 -); done < <(mount | grep phablet)
