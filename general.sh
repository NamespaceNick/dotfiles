#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac

read -p "This program will overwrite all relevant dotfiles and directories. \
  Are you sure you want to continue? [y/n] " BEGIN




pushd ~/                                  # /dotfiles --> /$HOME
ln -s `pwd`/.vimrc $HOME
                                          # TODO: Add the bin directory to the 
                                          # home directory
git clone \
  https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
popd                                      # /$HOME --> /dotfiles

# Create symlink to all files
declare -a to_move=(
                    ".aliases"
                    ".bash_functions"
                    ".bash_profile"
                    ".profile"
                    )


if $overwrite; then
  for file in "${to_move[@]}"
  do
    find "$file" -maxdepth 0 -delete
    ln -s $HOME/developer/dotfiles/$file $HOME
  done
else
  mkdir $HOME/old-dotfiles
  for file in "${to_move[@]}"
  do
    if find "$file" -maxdepth 0; then
      mv $HOME/$file $HOME/old-dotfiles/
    fi
  done
fi

read -p "Enter the name you would like for this machine (Prompt display): "\
  machine_name

echo "MACHINE_NAME=$machine_name; export MACHINE_NAME" > $HOME/.extra
