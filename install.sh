#!/usr/bin/env bash
#
# install.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

# os initialization script (macos->Darwin, linux->Linux)
UNAME=$(uname)
DOTPATH=$(cd $(dirname "$0") && pwd -P)

echo "Welcome! Please select an installation environment preset to proceed."
select env in "home" "work" "minimal"; do
  case $env in
  "home")
    INSTALLENV=$env
    break
    ;;
  "work")
    INSTALLENV=$env
    break
    ;;
  "minimal") exit ;;
  esac
done


# install applications for macos
if [[ ${UNAME} == "Darwin" ]]; then
  # install xcode tools
  sudo xcode-select --install

  # install homebrew
  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [[ "${INSTALLENV}" == "home" ]]; then
    cd ${DOTPATH}/homebrew/home
    brew bundle
    cd ${DOTPATH}
    ln -fs ${DOTPATH}/upgrade/macos/home/mac-upgrade.sh ~/mac-upgrade.sh
  elif [[ "${INSTALLENV}" == "work" ]]; then
    cd ${DOTPATH}/homebrew/work
    brew bundle
    cd ${DOTPATH}
    ln -fs ${DOTPATH}/upgrade/macos/work/mac-upgrade.sh ~/mac-upgrade.sh
  elif [[ "${INSTALLENV}" == "minimal" ]]; then
    # install minimum amount of packages
    brew install "git" "neovim" "bat" "fd" "ripgrep" "fzf"
    brew install --cask "ghostty" "hammerspoon" "karabiner-elements" "1password"
  fi

# install applications for linux
elif [[ ${UNAME} == "Linux" ]]; then
  apt update && apt install -y -o Dpkg::Options::="--force-overwrite" git ripgrep bat neovim

  ln -fs ${DOTPATH}/upgrade/linux/linux-upgrade.sh ~/linux-upgrade.sh
fi


# install zsh
${DOTPATH}/zsh/install.sh ${INSTALLENV}


# link p10k theme
ln -sf ${DOTPATH}/themes/p10k/.p10k.zsh ~/.p10k.zsh


# install vim configuration
${DOTPATH}/vim/install.sh


# configure git
git config --global user.name "Hengda Shi"
if [[ "${INSTALLENV}" == "home" ]]; then
  git config --global user.email "me@hengdashi.dev"
else
  echo "Please enter your email address for git purpose."
  read EMAIL
  if [[ -n ${EMAIL} ]]; then
    git config --global user.email "${EMAIL}"
  fi
fi
git config --global core.editor "vim"


# macOS configuration
if [[ ${UNAME} == "Darwin" ]]; then
  # configure ghostty
  if [[ ! -d ~/.config/ghostty ]]; then
    mkdir -p ~/.config/ghostty/
  fi
  ln -fs ${DOTPATH}/ghostty/config ~/.config/ghostty/config

  # configure hammerspoon
  if [[ ! -d ~/.hammerspoon ]]; then
    mkdir -p ~/.hammerspoon/
  fi
  ln -fs ${DOTPATH}/hammerspoon/init.lua ~/.hammerspoon/init.lua

  # configure karabiner
  if [[ ! -d ~/.config/karabiner ]]; then
    mkdir -p ~/.config/karabiner/assets/complex_modifications/
  fi
  ln -fs ${DOTPATH}/karabiner/custom-config.json ~/.config/karabiner/assets/complex_modifications/custom-settings.json

  # configure latexmk
  [[ ! -d ~/.config/latexmk ]] && mkdir ~/.config/latexmk
  ln -fs ${DOTPATH}/latexmk/latexmkrc ~/.config/latexmk/latexmkrc
fi

# configure tmux
[[ ! -e ~/.tmux.conf ]] && ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf
