#!/usr/bin/env bash

DOT="$HOME/developer/dotfiles"

# Just a bunch of the commands that I used to setup my environment
# throwing them all in here so I can sort through them later

mkdir $HOME/developer

# DOTFILES SETUP
ln -sf $DOT/.bash_profile $HOME/.bash_profile
ln -sf $DOT/.bashrc $HOME/.bashrc
ln -sf $DOT/.aliases $HOME/.aliases
ln -sf $DOT/.bash_functions $HOME/.bash_functions
ln -sf $DOT/.vimrc $HOME/.vimrc
cp -R $DOT/.vim/ $HOME/.vim


# Clone personal repos
mkdir $HOME/developer/portfolio
git clone git@github.com:NicolasDWilliams/NicolasDWilliams.github.io.git $HOME/developer/portfolio

pushd ~/$HOME/developer/
git clone git@github.com:NicolasDWilliams/test-files.git
popd

sudo apt update

# Vim
sudo apt install vim

##### TMUX SETUP
sudo apt install tmux
git clone git@github.com:NicolasDWilliams/.tmux.git $HOME/.tmux/
ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

##### BASH-GIT-PROMPT
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

##### RUBY
sudo apt install ruby
gem update --system

###### GCC, G++, Make
sudo apt install gcc
sudo apt install g++
sudo apt install make

##### JEKYLL
sudo apt-get install ruby-full build-essential zlib1g-dev
gem install jekyll bundler

##### HTML, CSS, JS
sudo apt install npm

##### c++ dev env
sudo apt install gcc
sudo apt install build-essential

