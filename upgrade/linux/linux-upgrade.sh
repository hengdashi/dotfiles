#!/usr/bin/env zsh

# linux-upgrade.sh

echo "################################"

echo "Upgrade antidote"
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote update

echo "################################"

echo "Upgrade System Packages"
sudo apt update
sudo apt -y full-upgrade
sudo do-release-upgrade

echo "################################"

echo "Upgrade micromamba base Packages"
micromamba update

echo "################################"
