#!/usr/bin/env bash
# Sets up terminal environment

# terminal colors & italics
tic -x $DOTFILE_PATH/xterm-256color-italic.terminfo

# bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
