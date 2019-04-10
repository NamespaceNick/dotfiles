#!/usr/bin/env bash

# Script that clones all commonly used repos from github
if [ ! -d "$HOME/developer" ]; then
  echo "No $HOME/developer/ directory detected... exiting"
  exit
fi

local TARG="$HOME/developer"

git clone git@github.com:NicolasDWilliams/test-files.git $TARG/test-files
git clone git@github.com:NicolasDWilliams/portfolio.git $TARG/portfolio
