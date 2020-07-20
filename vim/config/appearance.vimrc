" This is the appearance config for vim

filetype plugin indent on          " Load plugins according to detected filetype.
syntax on                          " Enable syntax highlighting.

set autoindent                     " Indent according to previous line.
set expandtab                      " Use spaces instead of tabs.
set softtabstop =4                 " Tab key indents by 4 spaces.
set shiftwidth  =4                 " >> indents by 4 spaces.
set shiftround                     " >> indents to next multiple of 'shiftwidth'.

set wrap                           " wrap line
set linebreak                      " enable linebreak
set showbreak=↪                    " show linebreak symbol
set colorcolumn=120                " set color on column at 120

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                         " Switch between buffers without having to save first.
set laststatus  =2                 " Always show statusline.
set display     =lastline          " Show as much as possible of the last line.
set number                         " Add line numbers
set relativenumber                 " Show relative line number

set showmatch                      " show matching brackets.
set showmode                       " Show current mode in command-line.
set showcmd                        " Show already typed keys when more are expected.
set noerrorbells visualbell t_vb=  " Disable bell

set incsearch                      " Highlight while searching with / or ?.
set hlsearch                       " Keep matches highlighted.
set ignorecase                     " case insensitive matching

set ttyfast                        " Faster redrawing.
set lazyredraw                     " Only redraw when necessary.

set splitbelow                     " Open new windows below the current window.
set splitright                     " Open new windows right of the current window.

set cursorline                     " Find the current line quickly.
set wrapscan                       " Searches wrap around end-of-file.
set report      =0                 " Always report changed lines.
set synmaxcol   =200               " Only highlight the first 200 columns.
set cc          =120               " set an 120 column border for good coding style

set list!                          " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'eol:$,tab:▸-,trail:~,extends:❯,precedes:❮,nbsp:±,space:·'
else
  let &listchars = 'eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:-,space:.'
endif

