#!/usr/bin/env bash

# Install + Update homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update

# Install bash-git-prompt
brew install bash-git-prompt
brew install pyenv
