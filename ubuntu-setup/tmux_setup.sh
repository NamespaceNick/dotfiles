#!/usr/bin/env bash

# install tmux, setup custom tmux configuration
sudo apt install -y tmux
git clone git@github.com:NicolasDWilliams/.tmux.git $HOME/.tmux/
ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tic -x $DOTFILE_PATH/tmux-256color.terminfo
