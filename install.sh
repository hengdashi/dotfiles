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
        "home" ) INSTALLENV=$env; break;;
        "work" ) INSTALLENV=$env; break;;
        "minimal" ) exit;;
    esac
done

echo "Please enter your email address for git purpose."
read EMAIL


# install applications for macos
if [[ ${UNAME} == "Darwin" ]]; then
  # install xcode tools
  sudo xcode-select --install

  # install homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi


  if [[ "${INSTALLENV}" == "home" ]]; then
    cd ${DOTPATH}/homebrew/home/Brewfile
    brew bundle
    cd ${DOTPATH}
    ln -fs ${DOTPATH}/upgrade/macos/home/mac-upgrade.sh ~/mac-upgrade.sh
  elif [[ "${INSTALLENV}" == "work" ]]; then
    cd ${DOTPATH}/homebrew/work/Brewfile
    brew bundle
    cd ${DOTPATH}
    ln -fs ${DOTPATH}/upgrade/macos/work/mac-upgrade.sh ~/mac-upgrade.sh
  elif [[ "${INSTALLENV}" == "minimal" ]]; then
    # install minimum amount of packages
    brew install "bat" "git" "git-lfs" "grep" "htop" "neovim" "ripgrep" "tmux" "trash-cli" "wget"
    brew install --cask "1password" "hammerspoon" "iterm2" "karabiner-elements" "micromamba" "the-unarchiver" "visual-studio-code"
  fi

# install applications for linux
elif [[ ${UNAME} == "Linux" ]]; then
  apt update && apt install -y -o Dpkg::Options::="--force-overwrite" git ripgrep bat neovim

  ln -fs ${DOTPATH}/upgrade/linux/linux-upgrade.sh ~/linux-upgrade.sh

  # install micromamba
  if [[ ! -d ~/micromamba ]]; then
    curl micro.mamba.pm/install.sh | zsh
  fi
fi

# install zsh
${DOTPATH}/zsh/zsh.sh

# link p10k theme
ln -sf ${DOTPATH}/themes/p10k/.p10k.zsh ~/.p10k.zsh

# install vim configuration
${DOTPATH}/vim/install.sh lua lazyvim

# configure git
git config --global user.name "Hengda Shi"
if [[ "${INSTALLENV}" == "home" ]]; then
  git config --global user.email "hengda.shi@engineering.ucla.edu"
elif [[ -n ${EMAIL} ]]; then
  git config --global user.email "${EMAIL}"
fi

git config --global core.editor "vim"


# macOS configuration
if [[ ${UNAME} == "Darwin" ]]; then
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

  # configure zathura
  [[ ! -d ~/.config/zathura ]] && mkdir ~/.config/zathura
  ln -fs ${DOTPATH}/zathura/zathurarc ~/.config/zathura/zathurarc
else
  if [[ "${INSTALLENV}" == "home" ]]; then
    # configure alacritty
    [[ ! -d ~/.config/alacritty ]] && mkdir ~/.config/alacritty
    ln -fs ${DOTPATH}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  fi
fi


# configure tmux
[[ ! -e ~/.tmux.conf ]] && ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf
