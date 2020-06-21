#!/usr/bin/env bash
# uses python3

# install python3 & pip3 if not already installed
sudo apt install python3
sudo apt install python3-pip
sudo apt install python3-venv

sudo ln -s /usr/bin/pip3 /usr/bin/pip
sudo ln -s /usr/bin/python3 /usr/bin/python
# TODO: Show dialogue to optionally symlink 'python' and 'pip' to python3 and pip3, respectively

declare -a packages=(
	requests
	black
)

for pkg in ${packages[@]}
do
	pip3 install $pkg
done
