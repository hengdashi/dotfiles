#!/usr/local/bin/zsh

# mac-upgrade.sh

DOTPATH=$(cd $(dirname $(readlink "$0"))/../.. && pwd -P)
BREWFILEPATH=${DOTPATH}/homebrew/Brewfile

echo "################################"

echo "Upgrade zprezto"
# source prezto first for non-interactive shell
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
zprezto-update

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
brew bundle cleanup --no-lock --force
brew cleanup

echo "################################"

echo "Commit to Gist"
git commit -am "update"
git push

echo "################################"

