#!/usr/bin/env zsh

UNAME=$(uname)
CWD=$(cd $(dirname "$0") && pwd -P)


# install neovim dependencies
pip install neovim
yarn global add neovim 


# link all neovim config
rm -r ~/.config/nvim
mkdir -p ~/.config/nvim/config
mkdir -p ~/.local/share/nvim/plugged
ln -fs ${CWD}/init.vim ~/.config/nvim/init.vim

if [[ ${UNAME} == "Darwin" ]]; then
  ln -fs ${CWD}/coc_config/macos/coc-settings.json ~/.config/nvim/coc-settings.json
elif [[ ${UNAME} == "Linux" ]]; then
  ln -fs ${CWD}/coc_config/linux/coc-settings.json ~/.config/nvim/coc-settings.json
fi

for vimrc in ${CWD}/config/*; do
  ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
done

