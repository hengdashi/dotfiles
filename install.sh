#!/usr/bin/env bash

# os initialization script (macos->Darwin, linux->Linux)
UNAME=$(uname)
DOTPATH=$(cd $(dirname "$0") && pwd -P)
COMMAND="$1"
EMAIL="$2"


# install applications for macos
if [[ ${UNAME} == "Darwin" ]]; then
  # install xcode tools
  sudo xcode-select --install

  # install homebrew
  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi


  if [[ "${COMMAND}" == "home" ]]; then
    cd ${DOTPATH}/homebrew/Brewfile
    brew bundle
    cd ${DOTPATH}
    ln -fs ${DOTPATH}/upgrade/macos/mac-upgrade.sh ~/mac-upgrade.sh
  else
    # install minimum amount of packages
    brew install "bat" "git" "git-lfs" "grep" "htop" "neovim" "ripgrep" "tmux" "trash-cli" "wget" "zsh" "zsh-completions"
    brew install --cask "1password" "alfred" "hammerspoon" "iterm2" "karabiner-elements" "miniconda" "slack" "the-unarchiver" "visual-studio-code" "zoom"
  fi

  # switch default shell to zsh
  [ "/usr/local/bin/zsh" != $(echo $SHELL) ] && chsh -s /usr/local/bin/zsh

# install applications for linux
elif [[ ${UNAME} == "Linux" ]]; then
  sudo apt update && sudo apt install -y -o Dpkg::Options::="--force-overwrite" zsh git ripgrep bat

  # switch default shell to zsh
  [ "zsh" != $(basename $(echo $SHELL)) ] && sudo chsh -s /usr/bin/zsh

  ln -fs ${DOTPATH}/upgrade/linux/linux-upgrade.sh ~/linux-upgrade.sh

  # install miniconda
  if [[ ! -d ~/miniconda ]]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda
    source ~/miniconda/bin/activate
    rm ~/miniconda.sh
  fi
fi


# init miniconda and install pip
if ! command -v conda &> /dev/null; then
  conda init $(basename ${SHELL})
  conda install -y pip
  pip install neovim neovim-remote yapf jedi pylint pynvim
fi

# install zsh distribution prezto
${DOTPATH}/zsh/prezto/prezto.sh


# install vim configuration
${DOTPATH}/vim/vim.sh


# configure git
git config --global user.name "Hengda Shi"
if [[ "${COMMAND}" == "home" ]]; then
  git config --global user.email "hengda.shi@engineering.ucla.edu"
elif [ $# -lt 2 ]; then
  git config --global user.email "${EMAIL}"
fi
git config --global core.editor "vim"


# macOS configuration
if [[ ${UNAME} == "Darwin" ]]; then

  if [[ "${COMMAND}" == "home" ]]; then

    # configure latexmk
    [[ ! -d ~/.config/latexmk ]] && mkdir ~/.config/latexmk
    ln -fs ${DOTPATH}/latexmk/latexmkrc ~/.config/latexmk/latexmkrc

    # configure zathura
    [[ ! -d ~/.config/zathura ]] && mkdir ~/.config/zathura
    ln -fs ${DOTPATH}/zathura/zathurarc ~/.config/zathura/zathurarc

  else

    # configure hammerspoon
    if [[ ! -d ~/.hammerspoon ]]; then
      mkdir -p ~/.hammerspoon/
    fi
    ln -fs ${DOTPATH}/hammerspoon/init.lua ~/.hammerspoon/init.lua

    # configure karabiner
    if [[ ! -d ~/.config/karabiner ]]; then
      mkdir -p ~/.config/karabiner/assets/complex_modifications/
    fi
    ln -fs ${DOTPATH}/karabiner/custom-config.json ~/.config/karabiner/assets/complex_modifications/custom-settings.json

  fi

else

  if [[ "${COMMAND}" == "home" ]]; then

    # configure alacritty
    [[ ! -d ~/.config/alacritty ]] && mkdir ~/.config/alacritty
    ln -fs ${DOTPATH}/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

  fi

fi


# configure tmux
[[ ! -e ~/.tmux.conf ]] && ln -fs ${DOTPATH}/tmux/.tmux.conf ~/.tmux.conf

