#!/bin/sh

PRGNAME="$(basename $0)"

SHORTHELP="usage: /$PRGNAME (-[h]|--help)?/
for a detailed list of options, use: \`$PRGNAME --help\`
"

HELPMSG="this script was originated by the following blog post:
https://linuxize.com/post/create-a-linux-swap-file/
afterwards the support for btrfs was added following the guide from this answer:
https://askubuntu.com/questions/1206157/can-i-have-a-swapfile-on-btrfs

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
  --file <path>      which file to use as swapfile (defaults to: '/swapfile')
"

SWAPFILE=/swapfile

fstabContent() {
  echo "$SWAPFILE swap swap defaults 0 0"
}

checkRoot() {
  if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
    exit 1
  fi
}

allocate() {
  if [ ! $SIZE ]; then
    echo "No <size> was provided to allocate"
    exit 1
  fi

  # - create the file
  fallocate -l $SIZE $SWAPFILE
  # if fail, try run with dd:
  ### BYTE_SIZE=`numfmt --from=iec $SIZE`
  ### SECTOR_SIZE=1024
  ### SECTOR_COUNT=`expr $BYTE_SIZE / $SECTOR_SIZE`
  ### dd if=/dev/zero of=$SWAPFILE bs=$SECTOR_SIZE count=$SECTOR_COUNT status=progress
  #
  # - Set correct permissions
  chmod 600 $SWAPFILE
  #
  # - (on btrfs) Disable COW for this file
  chattr +C $SWAPFILE
  #
  # - Set up a linux swap area
  mkswap $SWAPFILE --verbose
  #
  # - Enable the swap
  swapon $SWAPFILE
  #
  # - make it persistent
  fstabContent >> /etc/fstab
}

deallocate() {
  # 1. First, deactivate the swap using the following command
  swapoff -v $SWAPFILE
  #
  # 2. Remove the swap file entry /swapfile swap swap defaults 0 0 from the /etc/fstab file
  local FSTAB_CONTENT=`fstabContent`
  sed -i -e "/^${FSTAB_CONTENT//\//\\\/}$/d" /etc/fstab
  #
  # 3. Delete the actual swapfile
  rm $SWAPFILE
}

showHelp() {
  printf "%s" "$HELPMSG"
}

CMD=showHelp

while [ -n "$1" ]; do
  case "$1" in
    # you can insert your own options here to do stuff
    "--help"|"-h") showHelp ;;
    "--file")
      shift
      SWAPFILE="$1"
      ;;
    "--allocate")
      checkRoot
      CMD=allocate
      shift
      SIZE=$1
      ;;
    "--deallocate")
      checkRoot
      CMD=deallocate
      ;;
    *)
      printf "unknown option: '%s'\n\n%s" "$1" "$SHORTHELP"
      exit 1
      ;;
  esac

  shift
done

$CMD
