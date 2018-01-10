#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac

# /dotfiles --> /$HOME
pushd ~/

ln -s $HOME/.vim/.vimrc
ln -s $HOME/developer/dotfiles/bin $HOME/bin


# /$HOME --> /dotfiles
popd

# Create symlink to all files
declare -a to_move=(
                    ".aliases"
                    ".bash_functions"
                    ".bash_profile"
                    ".profile"
                    ".vim"
                    )

for file in "${to_move[@]}"
do
  ln -s $HOME/developer/dotfiles/$file $HOME
done
                    
