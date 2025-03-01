# zmodload zsh/zprof

# homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# set ripgrep config
export RIPGREP_CONFIG_PATH="/Users/hengdas/.ripgreprc"

function ipy() {
  uvx \
      --with pandas \
      $@ \
      ipython
}


eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh




######## WORK SPECIFIC #########

# set kubectl path
[ -f /usr/local/opt/asdf/asdf.sh ] && source /usr/local/opt/asdf/asdf.sh

# aliases for switching between tiers in k8s. (make sure to make selection in ZAM as well.)
alias k8s-d='export KUBECONFIG=~/.kube/configs/d1-dev-uw2; echo $KUBECONFIG'
alias k8s-x='export KUBECONFIG=~/.kube/configs/x1-pdx-ue1; echo $KUBECONFIG'
alias k8s-s='export KUBECONFIG=~/.kube/configs/s2-stg-ue1; echo $KUBECONFIG'
alias k8s-p='export KUBECONFIG=~/.kube/configs/p1-prod-ue1; echo $KUBECONFIG'

# switch path between worktrees
gswt() {
  local worktrees cwd
  # if not argument, use current path
  if [ -z "$1" ]; then
    cwd=$(pwd)
  else
    cwd="$1"
  fi
  worktrees=$(git worktree list | awk '{print $1}')
  # make it space separated
  worktrees=("${(f)worktrees}")
  for worktree in ${worktrees}; do
    if [ ${worktree} = ${cwd} ]; then
      # set starterview
      export STARTERVIEW=${worktree}
      # set zamu alias
      alias zamu="$STARTERVIEW/bin/laptop/macos/zamu.scpt"
      # set path
      export PATH="$STARTERVIEW/common/py/bin:$STARTERVIEW/bin:/Users/hengdas/.local/bin:/Users/hengdas/go/bin:$PATH"
      # set python path
      export PYTHONPATH="$STARTERVIEW:$PYTHONPATH"
      # set zr app config
      export ZR_APP_CONFIG=$STARTERVIEW
    fi
  done
}

MONOREPO="/Users/hengdas/ziprecruiter"
# set starterview
export STARTERVIEW=${MONOREPO}
# set zamu alias
alias zamu="$STARTERVIEW/bin/laptop/macos/zamu.scpt"
# set path
export PATH="$STARTERVIEW/common/py/bin:$STARTERVIEW/bin:/Users/hengdas/.local/bin:/Users/hengdas/go/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# set python path
export PYTHONPATH="$STARTERVIEW:$PYTHONPATH"
# set editor
export VISUAL="/opt/homebrew/bin/nvim"
export EDITOR="/opt/homebrew/bin/nvim"

# zprof
