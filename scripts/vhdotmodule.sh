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

modulefile() {
  echo "$ZSH_MODULES"
}

$CMD "$@"
