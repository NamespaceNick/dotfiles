#!/usr/bin/env bash

# Script to install tmux on CAEN (with no root access)

# Exit on error
set -e

# Create correct directories
mkdir -p $HOME/tmux_tmp
TMUXX=$HOME/tmux_tmp
pushd $TMUXX

# Download source files for libevent and tmux
wget https://github.com/downloads/libevent/libevent/libevent-2.0.20-stable.tar.gz
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz


##########################################
##              libevent                ##
##########################################
tar -xvzf libevent-2.0.20-stable.tar.gz
cd libevent-2.0.20-stable
./configure --prefix=$TMUXX --disable-shared
make
make install
cd ../


##########################################
##                tmux                  ##
##########################################

tar -xvzf tmux-2.6.tar.gz
cd tmux-2.6
./configure --prefix=$TMUXX CFLAGS="-I$TMUXX/include -I$TMUXX/include/ncurses" LDFLAGS="-L$TMUXX/lib -L$TMUXX/include/ncurses -L$TMUXX/include"
make && make install
cd ../
mv $TMUXX/bin/tmux $HOME/bin
rm -rf $TMUXX
popd
