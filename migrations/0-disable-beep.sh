#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

# reference link
# https://wiki.archlinux.org/index.php/PC_speaker#Disable_PC_Speaker

rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
