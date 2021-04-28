Making custom scripts
=====================

It's a tremendous good practice to add help messages to your custom scripts, otherwise you will end up always having to open your editor to read your code because you forgot how it works:

Here is a good template for you:

```bash
#!/bin/sh

PRGNAME="$(basename $0)"

SHORTHELP="usage: /$PRGNAME (-[h]|--help)?/
for a detailed list of options, use: \`$PRGNAME --help\`
"

HELPMSG="if you run $PRGNAME with no options it will display
the commitizen categories.

  -h\tdisplays this message
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
```

## Make sure the script is executed from project's root always

```sh
# Make sure the script is executed from project's root always
cd $(dirname $(realpath "$0"))/..
```
