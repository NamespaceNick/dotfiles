#!/usr/bin/env bash

# TODO: Make sure there is an internet connection
# TODO: Acquire root priveleges
sudo apt update
sudo apt install git
sudo apt install vim
sudo apt install curl

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

sudo apt install net-tools
