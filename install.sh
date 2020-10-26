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

  # link zprezto configuration
  ln -fs ${DOTPATH}/zsh/prezto/.zpreztorc ~/.zpreztorc
  # link p10k configuration
  ln -fs ${DOTPATH}/zsh/prezto/themes/p10k/.p10k.zsh ~/.p10k.zsh
fi


# configure nvim
# install external plugins for vim
if [[ ${UNAME} == "Darwin" ]]; then
  # install homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  brew install zsh git ripgrep bat yarn

  # switch default shell to zsh
  [ "zsh" != $(basename $(echo $SHELL)) ] && chsh -s /usr/local/bin/zsh


elif [[ ${UNAME} == "Linux" ]]; then
  # add newest yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install -o Dpkg::Options::="--force-overwrite" ripgrep bat yarn zsh git

  # switch default shell to zsh
  [ "zsh" != $(basename $(echo $SHELL)) ] && chsh -s /usr/bin/zsh

  # install miniconda
  if [[ ! -d $HOME/minoconda ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    source ~/miniconda/bin/activate
    conda init
    rm ~/miniconda.sh
  fi
fi


# install neovim dependencies
pip install neovim
yarn global add neovim 


# configure git
git config --global user.name "Hengda Shi"
git config --global user.email "hengda.shi@engineering.ucla.edu"
git config --global core.editor "vim"


# link all neovim config
rm -r ~/.config/nvim
mkdir -p ~/.config/nvim/config
mkdir -p ~/.local/share/nvim/plugged
ln -fs ${DOTPATH}/vim/init.vim ~/.config/nvim/init.vim
ln -fs ${DOTPATH}/vim/coc-settings.json ~/.config/nvim/coc-settings.json
for vimrc in ${DOTPATH}/vim/config/*; do
  ln -fs ${vimrc} ~/.config/nvim/config/$(basename ${vimrc})
done


# configure latexmk
if [[ ! -d ~/.config/latexmk ]]; then
  mkdir ~/.config/latexmk
fi
ln -fs ${DOTPATH}/latexmk/latexmkrc ~/.config/latexmk/latexmkrc

# configure zathura
if [[ ! -d ~/.config/zathura ]]; then
  mkdir ~/.config/zathura
fi
ln -fs ${DOTPATH}/zathura/zathurarc ~/.config/zathura/zathurarc


if ; then
# configure hammerspoon
if [[ ${UNAME} == "Darwin" ]] && [[ -d ~/.hammerspoon ]]; then
  ln -fs ${DOTPATH}/hammerspoon/init.lua ~/.hammerspoon/init.lua
fi

# configure tmux
if [[ ! -e ~/.tmux.conf ]]; then
  ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf
fi

