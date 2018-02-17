#!/usr/bin/env bash

# Script to install programs and tools that are necessary for both linux
# and Mac
while true; do
  read -p "Would you like to overwrite all \
    relevant dotfiles and directories? [y/n] " overwrite

  case "$overwrite" in
    [Yy]* ) overwrite=true; break;;
    [Nn]* ) overwrite=false; break;;
    * ) echo "Please enter yes or no.";;
  esac
done


pushd ~/                                  # /dotfiles --> /$HOME
ln -s `pwd`/.vimrc $HOME
                                          # TODO: Add the bin directory to the home directory
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
