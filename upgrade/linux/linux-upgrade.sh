#!/usr/bin/env zsh

# linux-upgrade.sh

echo "################################"

echo "Upgrade zprezto"
# source prezto first for non-interactive shell
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

CWD=$(pwd)
cd ${ZDOTDIR:-$HOME}/.zprezto
git pull --rebase --autostash
cd ${CWD}

zprezto-update

echo "################################"

echo "Upgrade System Packages"
sudo apt update
sudo apt -y full-upgrade
sudo do-release-upgrade

echo "################################"

echo "Upgrade micromamba base Packages"
micromamba update

echo "################################"
