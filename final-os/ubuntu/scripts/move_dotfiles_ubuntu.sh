#!/usr/bin/env bash

# Script to handle the copying of dotfiles from the repo to the machine
# Set destination variables
DFSRC="$HOME/developer/dotfiles"

# TODO: Just put all symlink dotfiles in a directory to make this process easier
# Install vim-plug & plugins, copy vimrc
cp -R $DFSRC/.vim/ $HOME/
ln -s $DFSRC/.vimrc $HOME/.vimrc
vim +PlugInstall +qall
touch $HOME/.vbuf

# Allow correct terminal settings
tic -o $HOME/.terminfo $DFSRC/xterm-256color-italic.terminfo

# Move core dotfiles
ln -s $DFSRC/.profile $HOME/.profile
ln -s $DFSRC/.bash_profile $HOME/.bash_profile
ln -s $DFSRC/.bashrc $HOME/.bashrc
ln -s $DFSRC/.bash_functions $HOME/.bash_functions
ln -s $DFSRC/.aliases $HOME/.aliases

source $HOME/.bashrc



