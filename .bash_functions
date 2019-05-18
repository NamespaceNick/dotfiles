#!/bin/env bash

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# add, commit, and push all current changes in a git repo at once
function lazygit() {
  if [ $# -ne 1 ] ; then
    echo "Please enter a commit message."
    exit 1
  fi
  git add --all
  git commit -m "$1"
  git push
}

# git add files, then commit them with message
function gitac () {
  # Requires at least 2 parameters, second parameter must be surrounded in quotes
  if [ "$#" -lt 2 ] ; then
    echo "ERROR: gitac requires at least 2 parameters"
    return 1
  fi

  # Print files and message to be added/committed
  numFiles=$(( $# - 1 ))
  echo "Files: $numFiles"
  for file in ${@:1:$numFiles} ; do
    echo -e "\t$file "
  done

  echo -e "Message: \n\t\"${@:$#}\"\n\n"
  echo "To proceed, press Enter. Press any other key to abort"

  # Verify command
  read -s -n 1 response
  if [[ $response != "" ]]; then
    return 1
  fi

  # Git add + Commit with message
  git add ${@:1:$numFiles}
  git commit -m "${@:$#}"


}

function sab() {
  open http://localhost:8080 http://localhost:8989 http://localhost:7878
}
