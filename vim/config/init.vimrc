" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
endif

" change leader keys
let g:mapleader="\<Space>"
let g:maplocalleader=","
" set color to be 256 
set t_Co=256

call plug#begin('~/.local/share/nvim/plugged')
  " ===========================================================================
  " interface
  " ===========================================================================
  " start page
  Plug 'mhinz/vim-startify'
  " statusline
  Plug 'itchyny/lightline.vim'
  "Plug 'vim-airline/vim-airline'
  " icon
  Plug 'ryanoasis/vim-devicons'
  " indent
  Plug 'Yggdroot/indentLine'
  " dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  " ===========================================================================
  " code intelligence and linting
  " ===========================================================================
  " linting
  "Plug 'dense-analysis/ale'
  " autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " fuzzy file finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " git integration
    Plug 'tpope/vim-fugitive'
    " fzf preview
    Plug 'junegunn/fzf.vim'

  " move on speed
  Plug 'easymotion/vim-easymotion'
  " rainbow parentheses
  Plug 'luochen1990/rainbow'
  " commenting
  Plug 'preservim/nerdcommenter'
  " multicursor
  "Plug 'terryma/vim-multiple-cursors'
  " snippets
  "Plug 'SirVer/ultisnips'
call plug#end()

