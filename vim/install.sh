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
DISTRO="$2"


# create dirs
[[ -d ~/.config/nvim ]] && rm -r ~/.cache/nvim ~/.local/share/nvim ~/.config/nvim

# link all neovim config
if [[ "${CONFIG}" == "lua" ]]; then
  if [[ "${DISTRO}" == "nvchad" ]]; then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    # install custom configs
    ln -fs ${CWD}/nvchad/lua/custom/ ~/.config/nvim/lua
  else
    ln -fs ${CWD}/lazyvim/lua/custom/ ~/.config/nvim/lua
  fi
else
  # install neovim dependencies
  pip install neovim
  if ! command -v yarn &> /dev/null; then
    npm install -g neovim
  else
    yarn global add neovim 
  fi

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
