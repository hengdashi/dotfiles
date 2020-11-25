#!/usr/local/bin/zsh

DOTPATH=$(cd $(dirname $(readlink "$0"))/../.. && pwd -P)
BREWFILEPATH=${DOTPATH}/homebrew/Brewfile

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
brew bundle dump --force --describe --file=${BREWFILEPATH}/Brewfile

echo "################################"

echo "Cleanup Uninstalled Formulas and Caches"
cd ${BREWFILEPATH}
brew bundle cleanup --force
brew cleanup

echo "################################"

echo "Commit to Gist"
git commit -am "update"
git push

echo "################################"

