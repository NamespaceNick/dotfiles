#!/usr/bin/env bash

# Installs necessary tools for new environment

os=false
if uname -a | grep -i 'ARCH' &> /dev/null ; then
  echo "I am on an arch system"
elif
  uname -a | grep -i 'darwin' &> /dev/null ; then
  echo "I am on a macbook"
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
