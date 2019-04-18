#!/usr/bin/env bash

# Install apps for personal use on an Ubuntu development environment

# gimp
sudo apt autoremove gimp gimp-plugin-registry
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update
sudo apt install gimp

sudo snap install discord
sudo snap install spotify
