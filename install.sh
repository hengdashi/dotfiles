#!/usr/bin/env zsh

# os initialization script (macos->Darwin, linux->Linux)
UNAME=$(uname)
DOTPATH="$(cd "$(dirname "$0")" && pwd -P)"

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

# configure nvim
rm -r ~/.config/nvim
mkdir -p ~/.config/nvim/config
ln -fs ${DOTPATH}/vim/init.vim ~/.config/nvim/init.vim
for vimrc in ${DOTPATH}/vim/config/*; do
ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
done

if [[ ! -e ~/.tmux.conf ]]; then
    ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf
fi

