#!/usr/bin/env bash

DOTF="$HOME/developer/dotfiles"

# Creates symlinks from the dotfiles repo to the machine's home directory

# Vim
cp -R $DOTF/.vim/ $HOME/.vim/
ln -s $DOTF/.vimrc $HOME/.vimrc
vim +PlugInstall +qall

# Bash
ln -sf $DOTF/.profile $HOME/.profile
