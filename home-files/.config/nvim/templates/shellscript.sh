#!/bin/sh

PRGNAME="$(basename $0)"

SHORTHELP="usage: /$PRGNAME (-[h]|--help)?/
for a detailed list of options, use: \`$PRGNAME --help\`
"

HELPMSG="if you run $PRGNAME with no options it will display
the commitizen categories.

  -h		short help message
  --help	display this message
"

case "$1" in
  # you can insert your own options here to do stuff
  "--help")
    printf "%s" "$HELPMSG"
    ;;
  "-h")
    printf "%s"  "$SHORTHELP"
    ;;
  *)
    printf "unknown option: '%s'\n\n%s" "$1" "$SHORTHELP"
    exit 1
    ;;
esac

# vim:ts=8
