" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
endif

call plug#begin()
  " dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  " autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " statusline
  Plug 'itchyny/lightline.vim'
call plug#end()

