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
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files ~<CR>

" remap startify session saving and loading
" save current session
nnoremap <leader>ls :SSave<CR>
" close current session
nnoremap <leader>lc :SClose<CR>
" load a session
nnoremap <leader>ll :SLoad<CR>
" delete a session
nnoremap <leader>ld :SDelete<CR>


