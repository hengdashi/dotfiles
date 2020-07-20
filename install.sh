#!/usr/bin/env zsh

# os initialization script (macos->Darwin, linux->Linux)
UNAME=$(uname)
DOTPATH=$(dirname $(realpath "$0"))

if [[ ! -d ~/.zprezto/ ]]; then
    # switch to zsh & prezto
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

# switch default shell to zsh
chsh -s /bin/zsh

# configure git
git config --global user.name "Hengda Shi"
git config --global user.email "hengda.shi@engineering.ucla.edu"
git config --global core.editor "vim"

if [[ -d ~/.config/nvim ]]; then
    ln -fs ${DOTPATH}/vim/init.vim ~/.config/nvim/init.vim
    rm -r ~/.config/nvim/config
    mkdir ~/.config/nvim/config
    for vimrc in ${DOTPATH}/vim/config/*; do
        ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
    done
fi

if [[ ! -e ~/.tmux.conf ]]; then
    ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf
fi

