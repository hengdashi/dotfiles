if !exists("g:os")
  let g:os = substitute(system('uname'), '\n', '', '')
endif

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
if g:os =~ "Darwin"
  let g:python3_host_prog = '/usr/local/Caskroom/miniconda/base/bin/python'
elseif g:os =~ "Linux"
  let g:python3_host_prog = '~/miniconda3/bin/python'
endif
let g:coc_global_extensions = ['coc-python', 'coc-texlab']

call plug#begin('~/.local/share/nvim/plugged')
  " ===========================================================================
  " interface
  " ===========================================================================
  " start page
  Plug 'mhinz/vim-startify'
  " show modified lines
  Plug 'mhinz/vim-signify'
  " statusline
  Plug 'itchyny/lightline.vim'
  " icon
  Plug 'ryanoasis/vim-devicons'
  " smooth scroll
  Plug 'psliwka/vim-smoothie'
  " indent
  Plug 'Yggdroot/indentLine'
  " auto-resize
  "Plug 'camspiers/animate.vim'
  Plug 'camspiers/lens.vim'
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

  " file explorer
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
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
  " ===========================================================================
  " languages
  " ===========================================================================
  " latex
  Plug 'lervag/vimtex'
  " lang pack (note that vimtex recently got removed from polyglot
  Plug 'sheerun/vim-polyglot'
  " templates
  Plug 'aperezdc/vim-template'
  " csv
  Plug 'mechatroner/rainbow_csv'
call plug#end()

