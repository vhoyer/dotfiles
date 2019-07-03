#!/bin/sh

PRGNAME="$(basename $0)"

SHORTHELP="usage: /$PRGNAME (-[h]|--help)?/
for a detailed list of options, use: \`$PRGNAME --help\`
"

HELPMSG="this script was originated by the following blog post:
https://linuxize.com/post/create-a-linux-swap-file/

You can verify the swap status.
To verify that the swap is active we can use either the swapon or the free command as shown below:

$ sudo swapon --show
$ sudo free -h

OPTIONS:

  -h                 displays this message
  --allocate <size>  define a memory size and allocate it.
                     the <size> must be in the following format:
                     /\\d+[GM]/
  --deallocate       delete the swap
"

checkRoot() {
  if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
    exit 1
  fi
}

allocate() {
  # 1. create the file
  fallocate -l $1 /swapfile
  # if fail run:
  # sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
  #
  # 2. Set correct permissions
  chmod 600 /swapfile
  #
  # 3. Set up a linux swap area
  mkswap /swapfile
  #
  # 4. Enable the swap
  swapon /swapfile
  #
  # 5. make it persistent
  echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
}

deallocate() {
  # 1. First, deactivate the swap using the following command
  swapoff -v /swapfile
  #
  # 2. Remove the swap file entry /swapfile swap swap defaults 0 0 from the /etc/fstab file
  sed -i -e "/^\/swapfile swap swap defaults 0 0$/d" /etc/fstab
  #
  # 3. Delete the actual swapfile
  rm /swapfile
}

case "$1" in
  # you can insert your own options here to do stuff
  "--help")
    printf "%s" "$HELPMSG"
    ;;
  "-h")
    printf "%s"  "$SHORTHELP"
    ;;
  "--allocate")
    checkRoot
    shift
    allocate $1
    ;;
  "--deallocate")
    checkRoot
    deallocate
    ;;
  *)
    printf "unknown option: '%s'\n\n%s" "$1" "$SHORTHELP"
    exit 1
    ;;
esac
