#!/usr/bin/env bash
# Script to install all necessary kegs for macOS

declare -a brew_install=(
                          "lua"
                          "python2.7"
                          "python3"
                          "ripgrep"
                        )

for file in "${brew_install[@]}"
do
  brew install "$file"
done

