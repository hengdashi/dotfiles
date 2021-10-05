#!/usr/bin/env bash
#
# vim.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

UNAME=$(uname)
CWD=$(cd $(dirname "$0") && pwd -P)


# install neovim dependencies
pip install neovim
if ! command -v yarn &> /dev/null; then
  npm install -g neovim
else
  yarn global add neovim 
fi


# link all neovim config
[[ -d ~/.config/nvim ]] && rm -r ~/.config/nvim
mkdir -p ~/.config/nvim/config
mkdir -p ~/.local/share/nvim/plugged
mkdir -p ~/.vim/files/info
ln -fs ${CWD}/init.vim ~/.config/nvim/init.vim

if [[ ${UNAME} == "Darwin" ]]; then
  ln -fs ${CWD}/coc_config/macos/coc-settings.json ~/.config/nvim/coc-settings.json
elif [[ ${UNAME} == "Linux" ]]; then
  ln -fs ${CWD}/coc_config/linux/coc-settings.json ~/.config/nvim/coc-settings.json
fi

for vimrc in ${CWD}/config/*; do
  ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
done

