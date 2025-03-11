#!/usr/bin/env zsh

# mac-upgrade.sh

DOTPATH=$(cd $(dirname $(readlink "$0"))/../../.. && pwd -P)
BREWFILEDIR=${DOTPATH}/homebrew/home
BREWFILEPATH=${BREWFILEDIR}/Brewfile

echo "################################"

echo "Upgrade antidote"
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote update

echo "################################"

echo "Upgrade Homebrew Formulas"
brew outdated
brew update
brew upgrade

echo "################################"

echo "Upgrade Homebrew Casks"
brew cu --all --yes --cleanup

echo "################################"

echo "Upgrade MacOS App Store Apps"
mas upgrade

echo "################################"

echo "Dump Current Packages to Brewfile"
brew bundle dump --force --describe --file=${BREWFILEPATH}

echo "################################"

echo "Cleanup Uninstalled Formulas and Caches"
cd ${BREWFILEDIR}
brew bundle cleanup --force
brew cleanup
