#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac

read -p "This program will overwrite all relevant dotfiles and directories. \
Press any key to continue. " ANYKEY

# TODO: Have different path if this is on a CAEN computer
# TODO: Different path if repository is not in the developer directory

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

mkdir $HOME/old-dotfiles
for file in "${to_move[@]}"
do
  if find "$file" -maxdepth 0; then
    mv -v $HOME/$file $HOME/old-dotfiles/
  fi
  ln -s $HOME/developer/dotfiles/$file
done

read -p "Enter the name you would like for this machine (Prompt display): "\
  machine_name

echo "export MACHINE_NAME=$machine_name" > $HOME/.extra
