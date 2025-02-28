#!/usr/bin/env bash
#
# zsh.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

UNAME=$(uname)
CWD=$(cd $(dirname "$0") && pwd -P)
INSTALL_ENV="$1"

# install zsh for macos
if [[ ${UNAME} == "Darwin" ]]; then
  brew install "zsh" "zsh-completions"

  # switch default shell to zsh
  [ "/usr/local/bin/zsh" != $(echo $SHELL) ] && chsh -s /usr/local/bin/zsh
# install zsh for linux
elif [[ ${UNAME} == "Linux" ]]; then
  apt update && apt install -y -o Dpkg::Options::="--force-overwrite" zsh

  # switch default shell to zsh
  if command -v sudo &> /dev/null; then
    [ "zsh" != $(basename $(echo $SHELL)) ] && sudo chsh -s /usr/bin/zsh
  fi

  # install antidote
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# link antidote zsh plugins
ln -sf ${CWD}/antidote/.zsh_plugins.txt ~/.zsh_plugins.txt

if [[ ${UNAME} == "Darwin" ]]; then
  if [[ ${INSTALL_ENV} == "home" ]]; then
    ln -sf ${CWD}/zshrc/macos/home/.zshrc ~/.zshrc
  elif [[ ${INSTALL_ENV} == "work" ]]; then
    ln -sf ${CWD}/zshrc/macos/work/.zshrc ~/.zshrc
  fi
elif [[ ${UNAME} == "Linux" ]]; then
  ln -sf ${CWD}/zshrc/linux/.zshrc ~/.zshrc
fi
