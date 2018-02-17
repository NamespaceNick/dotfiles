#!/usr/bin/env bash

# Installs necessary tools for new environment

gnu=false
osx=false

if [[ $OSTYPE == darwin* ]] ; then
  osx=true
elif [[ $OSTYPE == gnu* ]] ; then
  gnu=true
else
  echo "ERROR::UNRECOGNIZED OS::EXITING"
  exit 1
fi

read -p "Automatic (Yy) or Manual (Nn) installation? " automatic

if $automatic ; then
  source automatic.sh
else
  source manual.sh
fi
