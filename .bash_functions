#!/bin/env bash

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

function rm() {
  if [ -z ${TEMPTRASH+x} ] && [ -d $TEMPTRASH ] ; then
    echo "ERROR:: No identified temporary trash location on this machine.\
 Identify such a path in ~/.extra or disable this function in ~/.bash_functions"
    return 0
  fi

  for file in "$@"
  do
    mv "$file" "$TEMPTRASH"
    echo "Removed $file"
  done
}
