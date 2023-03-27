#!/bin/sh

ZSH_MODULES="$HOME/.zshrc.dotfiles.modules"
PRGNAME="$(basename "$0")"

HELPMSG="usage: /$PRGNAME (-[h]|--help)?/
"

while [ $# -ne 0 ]; do
  case "$1" in
    -h | --help)
      printf "%s" "$HELPMSG"
      exit 0
      ;;
    *) break ;;
  esac
  shift
done

CMD="$1"
shift

##
# add the text to the ZSH_MODULES file to be later loaded by /home-files/.zshrc
# don't readd files that already exist
add() {
  while [ $# -ne 0 ]; do
    case "$1" in
      -h | --help)
        printf "%s" "$HELPMSG"
        exit 0
        ;;
      *) break ;;
    esac
    shift
  done

  echo "$1" >> "$ZSH_MODULES"
  cp "$ZSH_MODULES" "/tmp/${PRGNAME}1"
  <"/tmp/${PRGNAME}1" uniq >"$ZSH_MODULES"
}

##
# remove module name from ZSH_MODULES file
remove() {
  while [ $# -ne 0 ]; do
    case "$1" in
      -h | --help)
        printf "%s" "$HELPMSG"
        exit 0
        ;;
      *) break ;;
    esac
    shift
  done

  sed -ie "/^$1$/d" "$ZSH_MODULES"
}

##
# return config file name to centralize where this file lies only on this file
modulefile() {
  echo "$ZSH_MODULES"
}

$CMD "$@"
