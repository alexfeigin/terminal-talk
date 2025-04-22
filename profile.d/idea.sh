#!/usr/bin/env bash

idea() {
  if "$(osascript -e 'application "IntelliJ IDEA" is running')"; then
    "/Applications/IntelliJ IDEA.app/Contents/MacOS/idea" "$@"
  else
    open -na 'IntelliJ IDEA' --args "$@"
  fi
}
