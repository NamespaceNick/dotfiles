#!/usr/bin/env bash

# Installs necessary tools for new environment

os=false
if uname -a | grep -i 'ARCH' &> /dev/null ; then
  echo "OS: Arch Linux"
elif uname -a | grep -i 'darwin' &> /dev/null ; then
  echo "OS: MacOS"
elif uname -a | grep -i 'ubuntu' &> /dev/null ; then
  echo "OS: Ubuntu Linux"
else
  echo "I am not on a macbook or arch system"
fi
exit 0


if [[ $OSTYPE == darwin* ]] ; then
  os=osx
elif [[ $OSTYPE == gnu* ]] ; then
  os=
else
  echo "ERROR::UNRECOGNIZED OS::EXITING"
  exit 1
fi

source install.sh
