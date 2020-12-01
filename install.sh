#!/usr/bin/env bash

# os initialization script (macos->Darwin, linux->Linux)
UNAME=$(uname)
DOTPATH=$(cd $(dirname "$0") && pwd -P)


# install applications for macos
if [[ ${UNAME} == "Darwin" ]]; then
  # install xcode tools
  sudo xcode-select --install

  # install homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  cd ${DOTPATH}/homebrew/Brewfile
  brew bundle
  cd ${DOTPATH}

  # switch default shell to zsh
  [ "/usr/local/bin/zsh" != $(echo $SHELL) ] && chsh -s /usr/local/bin/zsh

# install applications for linux
elif [[ ${UNAME} == "Linux" ]]; then
  # add newest yarn
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install -y -o Dpkg::Options::="--force-overwrite" zsh git ripgrep bat yarn

  # switch default shell to zsh
  [ "zsh" != $(basename $(echo $SHELL)) ] && sudo chsh -s /usr/bin/zsh

  # install miniconda
  if [[ ! -d ~/miniconda ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    source ~/miniconda/bin/activate
    conda init
    rm ~/miniconda.sh
    conda install -y pip
  fi
fi


# install zsh distribution prezto
${DOTPATH}/zsh/prezto/prezto.sh


# install vim configuration
${DOTPATH}/vim/vim.sh


# configure git
git config --global user.name "Hengda Shi"
git config --global user.email "hengda.shi@engineering.ucla.edu"
git config --global core.editor "vim"


# macOS configuration
if [[ ${UNAME} == "Darwin" ]]; then
  # configure latexmk
  [[ ! -d ~/.config/latexmk ]] && mkdir ~/.config/latexmk
  ln -fs ${DOTPATH}/latexmk/latexmkrc ~/.config/latexmk/latexmkrc

  # configure zathura
  [[ ! -d ~/.config/zathura ]] && mkdir ~/.config/zathura
  ln -fs ${DOTPATH}/zathura/zathurarc ~/.config/zathura/zathurarc

  # configure hammerspoon
  [[ -d ~/.hammerspoon ]] && ln -fs ${DOTPATH}/hammerspoon/init.lua ~/.hammerspoon/init.lua


  # configure karabiner
  [[ -d ~/.config/karabiner ]] && ln -fs ${DOTPATH}/karabiner/custom-config.json ~/.config/karabiner/assets/complex_modifications/custom-settings.json
fi


# configure tmux
[[ ! -e ~/.tmux.conf ]] && ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf

