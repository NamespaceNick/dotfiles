#!/usr/bin/env bash

# NOTE: Run this script with root priveleges

git=true
ncurses=true
rust=true
vim=true

# TODO
  # Ensure ordering is correct
  # Handle possible errors while installing. What to output and how to detect
  # Change path to include newly installed vim
  # Create and download everything into certain folders throughout process
  # Neovim
  # Mail app

apt-get update

# Git
if $git ; then
  echo "Installing git.."
  apt install git
  echo "..Success.."
fi

# Ncurses
if $ncurses ; then
  echo "Installing ncurses.."
  apt-get install ncurses-dev
  echo "..Success.."
fi

# Rust
if $rust ; then
  echo "Installing Rust.."
  curl https://sh.rustup.rs -sSf | sh
  echo "..Success.."
fi

# Vim
if $vim ; then
  echo "Installing Vim.."
  # Vim-plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Vim
  git clone https://github.com/vim/vim.git
  cd vim
  cd src
  make
  make install
  mv /usr/bin/vim /usr/bin/vim_outdated
  ln -s /usr/local/bin/vim /usr/bin/vim
  echo "..Success.."
fi

