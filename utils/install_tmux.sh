#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# create our directories
mkdir -p $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz

# extract files, configure, and compile

############
# libevent #
############
echo "Start libevent"
tar xvzf libevent-2.1.12-stable.tar.gz
cd libevent-2.1.12-stable
./confiure --prefix=$HOME/local --disable-openssl --disable-shared
make -j 8
make install
cd ..
echo "End libevent"

############
# ncurses  #
############
echo "Start ncurses"
tar xvzf ncurses-6.2.tar.gz
cd ncurses-6.2
./configure --prefix=$HOME/local
make -j 8
make install
cd ..
echo "End ncurses"

############
# tmux     #
############
echo "Start tmux"
tar xvzf tmux-3.2.tar.gz
cd tmux-3.2
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..
echo "End tmux"

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
