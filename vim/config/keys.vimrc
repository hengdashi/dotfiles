" Unmap Q, useless in most cases
nmap Q <Nop>

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>


" make up and down could move on the same line
nnoremap j gj
nnoremap k gk

" remap tab switch from gt to tab
nnoremap <tab> gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" clear highlight
nnoremap <esc> :noh<CR>

" terminal model remap
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>

" remap fzf commands
if has_key(plugs, 'fzf.vim')
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>F :Files ~<CR>
endif


" remap startify session saving and loading
if has_key(plugs, 'vim-startify')
  " save current session
  nnoremap <leader>ss :SSave<CR>
  " close current session
  nnoremap <leader>sc :SClose<CR>
  " load a session
  nnoremap <leader>sl :SLoad<CR>
  " delete a session
  nnoremap <leader>sd :SDelete<CR>
endif

" remap git commands
if has_key(plugs, 'vim-fugitive')
  nnoremap <leader>ga :Git add %:p<CR><CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit -v -q<CR>
  nnoremap <leader>gt :Gcommit -v -q %:p<CR>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>gr :Gread<CR>
  nnoremap <leader>gw :Gwrite<CR><CR>
  nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
  nnoremap <leader>gp :Ggrep<Space>
  nnoremap <leader>gm :Gmove<Space>
  nnoremap <leader>gb :Git branch<Space>
  nnoremap <leader>go :Git checkout<Space>
  nnoremap <leader>gps :Dispatch! git push<CR>
  nnoremap <leader>gpl :Dispatch! git pull<CR>
endif

