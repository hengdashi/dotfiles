#!/usr/bin/env bash
#
# zsh.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

UNAME=$(uname)
CWD=$(cd $(dirname "$0") && pwd -P)

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
fi

# install prezto
${CWD}/prezto/prezto.zsh

if [[ ${UNAME} == "Linux" ]]; then
  ln -sf ${CWD}/zshrc/linux/.zshrc ~/.zshrc
fi
