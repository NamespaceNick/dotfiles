#!/usr/bin/env bash

# script to install development environment on a fresh install of ubuntu

# TODO: Find a way to give temporary sudo priveleges to the script, once run

# update repositories
sudo apt-get update

# Vim
sudo apt-get install vim

# gconf2
sudo apt install gconf2

# tmux
sudo apt install tmux
pushd $HOME
git clone -recurse-submodules git@github.com:NicolasDWilliams/.tmux.git

# allow for ssh to home computer
sudo apt install openssh-client openssh-server net-tools


