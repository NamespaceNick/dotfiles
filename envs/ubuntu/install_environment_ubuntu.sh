#!/usr/bin/env bash

# script to install development environment on a fresh install of ubuntu

# TODO: Find a way to give temporary sudo priveleges to the script, once run
DOTS=$HOME/developer/dotfiles
# update repositories
sudo apt-get update

# Vim
sudo apt-get install vim

# gconf2
sudo apt install gconf2

# upgraded terminal
sudo apt upgrade -f gnome-terminalj

# tmux
sudo apt install tmux
pushd $HOME
git clone -recurse-submodules git@github.com:NicolasDWilliams/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
ln -s -f ~/.tmux/.tmux.conf.local
popd


# allow for ssh to home computer
sudo apt install openssh-client openssh-server net-tools

# menlo regular font for terminal
  # save font in the system
sudo mkdir -p ~/.fonts/truetype/menlo-regular
sudo cp $DOTS/misc/Menlo-Regular.ttf ~/.fonts/truetype/menlo-regular
sudo fc-cache -f -v

  #unset use system fixed-width font checkbox
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type=boolean false
  # set font
  # TODO: Need to find out how to actually set the font



#### APPLICATIONS ####

# ripgrep
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
sudo dpkg -i ripgrep_0.10.0_amd64.deb


