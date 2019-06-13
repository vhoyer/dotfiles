#!/bin/sh

#
# this script must be run in sudo mode
#
# https://linuxize.com/post/create-a-linux-swap-file/

# 1. create the file

fallocate -l 2G /swapfile
# if fail run:
# sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576

# 2. Set correct permissions

chmod 600 /swapfile

# 3. Set up a linux swap area

mkswap /swapfile

# 4. Enable the swap

swapon /swapfile

# 5. make it persistent

echo "/swapfile swap swap defaults 0 0" >> /etc/fstab 

# You can verify the swap status.
# 
# To verify that the swap is active we can use either the swapon or the free command as shown below:
# 
# $ sudo swapon --show
#
# NAME      TYPE  SIZE   USED PRIO
# /swapfile file 1024M 507.4M   -1
#
# $ sudo free -h
#
#               total        used        free      shared  buff/cache   available
# Mem:           488M        158M         83M        2.3M        246M        217M
# Swap:          1.0G        506M        517M

# 
