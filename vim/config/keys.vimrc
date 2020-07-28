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
  nnoremap <leader>ls :SSave<CR>
  " close current session
  nnoremap <leader>lc :SClose<CR>
  " load a session
  nnoremap <leader>ll :SLoad<CR>
  " delete a session
  nnoremap <leader>ld :SDelete<CR>
endif

" remap git commands
if has_key(plugs, 'vim-fugitive')
  nnoremap <space>ga :Git add %:p<CR><CR>
  nnoremap <space>gs :Gstatus<CR>
  nnoremap <space>gc :Gcommit -v -q<CR>
  nnoremap <space>gt :Gcommit -v -q %:p<CR>
  nnoremap <space>gd :Gdiff<CR>
  nnoremap <space>ge :Gedit<CR>
  nnoremap <space>gr :Gread<CR>
  nnoremap <space>gw :Gwrite<CR><CR>
  nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
  nnoremap <space>gp :Ggrep<Space>
  nnoremap <space>gm :Gmove<Space>
  nnoremap <space>gb :Git branch<Space>
  nnoremap <space>go :Git checkout<Space>
  nnoremap <space>gps :Dispatch! git push<CR>
  nnoremap <space>gpl :Dispatch! git pull<CR>
endif

