#!/bin/sh

if [ ! -d "./.git/" ]; then
  echo "run script at the root of the repository you want to implement the hook into"
  exit 1
fi

gitmoji-fuzzy-hook-init >> ./.git/hooks/prepare-commit-msg
chmod +x ./.git/hooks/prepare-commit-msg
