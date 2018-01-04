#!/usr/bin/env bash

# NOTE: Run this script with sudo priveleges

firefox=true
spotify=true

# TODO

# Firefox
if $firefox ; then
  apt-get -d install firefox
fi

# Spotify
if $spotify ; then
  snap install spotify
fi


