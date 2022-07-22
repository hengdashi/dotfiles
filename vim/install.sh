#!/usr/bin/env bash
#
# install.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

UNAME=$(uname)
CWD=$(cd $(dirname "$0") && pwd -P)
CONFIG="$1"


# install neovim dependencies
pip install neovim
if ! command -v yarn &> /dev/null; then
  npm install -g neovim
else
  yarn global add neovim 
fi

# create dirs
[[ -d ~/.config/nvim ]] && rm -r ~/.config/nvim

# link all neovim config
if [[ "${CONFIG}" == "lua" ]]; then
  mkdir -p ~/.config/nvim/lua/custom
  # install nvchad configs
  ln -fs ${CWD}/lua/nvchad/init.lua ~/.config/nvim/init.lua
  for conf in ${CWD}/lua/nvchad/lua/*; do
    ln -fs ${conf} ~/.config/nvim/lua/$(basename ${conf})
  done
  # install custom configs
  for conf in ${CWD}/lua/custom/*; do
    ln -fs ${conf} ~/.config/nvim/lua/custom/$(basename ${conf})
  done
else
  mkdir -p ~/.config/nvim/config
  mkdir -p ~/.local/share/nvim/plugged
  mkdir -p ~/.vim/files/info
  ln -fs ${CWD}/vimscript/init.vim ~/.config/nvim/init.vim
  for vimrc in ${CWD}/vimscript/config/*; do
    ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
  done

  if [[ ${UNAME} == "Darwin" ]]; then
    ln -fs ${CWD}/vimscript/coc_config/macos/coc-settings.json ~/.config/nvim/coc-settings.json
  elif [[ ${UNAME} == "Linux" ]]; then
    ln -fs ${CWD}/vimscript/coc_config/linux/coc-settings.json ~/.config/nvim/coc-settings.json
  fi
fi
