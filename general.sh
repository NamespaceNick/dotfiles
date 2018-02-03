#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac
install=true

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

if $install ; then
  for file in "${to_move[@]}"
  do
    ln -s $HOME/developer/dotfiles/$file $HOME
  done
else
  mkdir $HOME/old-dotfiles
  for file in "${to_move[@]}"
  do
    mv $HOME/$file $HOME/old-dotfiles
  done
  mv $HOME/.vimrc $HOME/old-dotfiles
  mv $HOME/.vim $HOME/old-dotfiles
  mv $HOME/bin $HOME/old-dotfiles

fi

                    
