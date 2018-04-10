#!/usr/bin/env bash

# Installs necessary tools for new environment

os=false

if [[ $OSTYPE == darwin* ]] ; then
  os=osx
elif [[ $OSTYPE == gnu* ]] ; then
  os=
else
  echo "ERROR::UNRECOGNIZED OS::EXITING"
  exit 1
fi

read -p "Automatic (Yy) or Manual (Nn) installation? " automatic



case $automatic in
  [Yy]*) automatic=true;;
  [Nn]*) automatic=false;;
      *) echo "Usage: {Y|y|N|n}"
        exit 1 ;;
esac

if [ "$automatic" = false ] ; then
  source manual.sh
  exit 0
fi
