#!/usr/bin/env bash

# Installs all command line tools necessary for my development environment

# TODO: Make sure there is an internet connection
# TODO: Acquire root priveleges
sudo apt update
sudo apt install git
sudo apt install vim
sudo apt install curl
sudo apt install net-tools

# Python tools
sudo apt install python-pip
sudo apt install python-virtualenv
pip install Flask
pip install watchdog
pip install -U python-dotenv
sudo apt install python3-venv

# tmux
sudo apt install tmux
git clone git@github.com:NicolasDWilliams/.tmux.git $HOME/.tmux/
ln -s $HOME/.tmux/.tmux.conf $HOME/

# bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1

