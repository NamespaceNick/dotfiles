#!/usr/bin/env bash

# Installs all command line tools necessary for my development environment

# Tests if package $1 exists. If not, installs it
# Usage: install_command git
install_command()
{
  # Enforce number of parameters
  if [ "$#" -ne 1 ] ; then
    echo "ERROR - Couldn't parse command:\n\tinstall_command $#\n"
    return
  fi

  # TODO: Check if package is installed

  # TODO: Install package if necessary
}

# TODO: Make sure there is an internet connection
# TODO: Acquire root priveleges
sudo apt update
sudo apt install git
sudo apt install vim
sudo apt install curl
sudo apt install net-tools
sudo apt install tree

# Python tools
sudo apt install python-pip
sudo apt install python-virtualenv
pip install Flask
pip install watchdog
pip install -U python-dotenv
sudo apt install python3-venv

# SSH k

# tmux
sudo apt install tmux
git clone git@github.com:NicolasDWilliams/.tmux.git $HOME/.tmux/
ln -s $HOME/.tmux/.tmux.conf $HOME/

# bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1

# ruby & jekyll
sudo apt install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bash_profile
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bash_profile
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bash_profile

sudo apt install openssh-server

