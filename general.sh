#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac

# Actions for the Home directory
pushd ~/

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
