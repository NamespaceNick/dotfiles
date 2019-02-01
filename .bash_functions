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

function sab() {
  open http://localhost:8080 http://localhost:8989 http://localhost:7878
}
