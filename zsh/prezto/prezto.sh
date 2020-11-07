#!/usr/bin/env zsh

CWD=$(cd $(dirname "$0") && pwd -P)

if [[ ! -d ~/.zprezto/ ]]; then
  # switch to zsh & prezto
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  # link zprezto configuration
  ln -fs ${CWD}/.zpreztorc ~/.zpreztorc
fi

