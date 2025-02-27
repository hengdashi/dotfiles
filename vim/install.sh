#!/usr/bin/env bash
#
# install.sh
# Copyright (C) 2021 Hengda Shi <hengdas@engineering.ucla.edu>
#
# Distributed under terms of the MIT license.
#

CWD=$(cd $(dirname "$0") && pwd -P)

if [[ ! -d ~/.config/nvim ]]; then
  mkdir -p ~/.config/nvim/
  # link all neovim config
  ln -fs ${CWD}/lazyvim/init.lua ~/.config/nvim/init.lua
  ln -fs ${CWD}/lazyvim/lua ~/.config/nvim/
fi
