#!/bin/sh

PRGNAME="$(basename $0)"

# BEGIN PARAMETERS
_open_browser="--open-browser"
b="-b"

_watch="--watch"
w="-w"
# END PARAMETERS

SHORTHELP="usage: $PRGNAME [options]
for a detailed list of options, use: \`$PRGNAME --help\`
"

HELPMSG="if you run $PRGNAME with no options it will display run the default
action.

  -h		short help message
  --help	display this message

  $b,$_open_browser
  		run $PRGNAME opening the coverage report on browser afterwards
  $w,$_watch	re-run $PRGNAME whenever files change
"

defaultAction() {
  # Process and validate arguments
  while [ -n "$1" ]; do
    case "$1" in
      # Open browser after done with the coverage
      $b|$_open_browser) DO_OPEN_BROWSER=1 ;;
      # Watch for file change and run coverage again
      $w|$_watch) DO_WATCH=1 ;;
      *)
        COLOR_RED="\033[0;31m"
        echo "${COLOR_RED}Invalid Option \"$1\", run \`$PRGNAME --help\` to see a full list of valid parameters"
        exit 1
        ;;
    esac

    shift
  done

  # Make sure the script is executed from project's root always
  cd $(dirname $(realpath "$0"))/..

  #
  # Actual logic
  #

  git diff master --name-only | # Get only the file names from diff on master
    sed -e 's/\.\w\+$//' | # remove every extension
    tr '\n' '\|' | # change every line break (\n) to a escaped pipe ('\|') will be used as RegEx "OR"
    sed -e 's/|$//' >/tmp/difffilenames # remove the last pipe and safe to file

  COLLECT_COVERAGE_FROM="{`cat /tmp/difffilenames |
    sed -e 's/|/.{js,vue},/g'`.{js,vue}}" # change every pipe (|) to a .{js,vue} as glob pattern

  TEST_PATH_PATTERN="(`cat /tmp/difffilenames |
    sed -e 's/assets\/js\///g' | # Tests for assets/js/{service/,utils/} are on test/{service/,utils/}
    sed -e 's/config\/router\/[^/]*|/config\/router|/g'`)" # Any file on config/router/ must run the config/router.test.js

  echo "Running tests..."

  npm run test --silent -- \
    --coverage \
    --collectCoverageFrom=$COLLECT_COVERAGE_FROM \
    --testPathPattern=$TEST_PATH_PATTERN

  [ $DO_OPEN_BROWSER ] &&
    xdg-open ./test/coverage/index.html &&
    unset DO_OPEN_BROWSER # Prevent opening of browser when watch repeats this command

  [ $DO_WATCH ] &&
    echo "\n\nWaiting for file changes to run command again, to cancel this behavior press CTRL-C\n\n" &&
    watch -d -t -g ls -lR | sha1sum && # https://superuser.com/a/1056022/645675
    defaultAction # rerun command
}

case "$1" in
  # you can insert your own options here to do stuff
  "--help")
    printf "%s" "$HELPMSG"
    ;;
  "-h")
    printf "%s"  "$SHORTHELP"
    ;;
  *)
    defaultAction $@
    ;;
esac

# vim:ts=8
