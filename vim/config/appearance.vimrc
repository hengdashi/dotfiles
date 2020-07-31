" This is the appearance config for vim

" no longer needed as vim-plug will auto invoke them
" filetype plugin indent on          " Load plugins according to detected filetype.
syntax enable                      " Enable syntax highlighting.

set autoindent                     " Indent according to previous line.
set expandtab                      " Use spaces instead of tabs.
set softtabstop =2                 " Tab key indents by 2 spaces.
set shiftwidth  =2                 " >> indents by 2 spaces.
set shiftround                     " >> indents to next multiple of 'shiftwidth'.

set wrap                           " Wrap line
set linebreak                      " Enable linebreak
set showbreak   =↪                 " Show linebreak symbol
"set colorcolumn =80                " Set color on column at 80

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                         " Switch between buffers without having to save first.
set laststatus  =2                 " Always show statusline.
set display     =lastline          " Show as much as possible of the last line.
set number                         " Add line numbers
set relativenumber                 " Show relative line number
set mouse+=a                       " Use mouse to scroll
set clipboard=unnamed              " use system clipboard

set showmatch                      " Show matching brackets.
set noshowmode                     " Not show current mode in command-line (show by lightline).
set showcmd                        " Show already typed keys when more are expected.
set showtabline =2                 " Always show tabline
set noerrorbells visualbell t_vb=  " Disable bell

set incsearch                      " Highlight while searching with / or ?.
set hlsearch                       " Keep matches highlighted.
set ignorecase                     " Case insensitive matching
set smartcase                      " Smart case matching

set ttyfast                        " Faster redrawing.
set lazyredraw                     " Only redraw when necessary.

set splitbelow                     " Open new windows below the current window.
set splitright                     " Open new windows right of the current window.

set cursorline                     " Find the current line quickly.
set wrapscan                       " Searches wrap around end-of-file.
set report      =0                 " Always report changed lines.
set synmaxcol   =500               " Only highlight the first 500 columns.
"set cc          =80                " Set an 80 column border for good coding style

set list!                          " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'eol:$,tab:▸-,trail:~,extends:❯,precedes:❮,nbsp:±,space:·'
else
  let &listchars = 'eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:-,space:.'
endif

let g:terminal_color_0  = '#21222C'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#F8F8F2'
let g:terminal_color_8  = '#6272A4'
let g:terminal_color_9  = '#FF6E6E'
let g:terminal_color_10 = '#69FF94'
let g:terminal_color_11 = '#FFFFA5'
let g:terminal_color_12 = '#D6ACFF'
let g:terminal_color_13 = '#FF92DF'
let g:terminal_color_14 = '#A4FFFF'
let g:terminal_color_15 = '#FFFFFF'

