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

" quit and save shortcut
nnoremap <leader>q :q!<CR>

" terminal mode remap
nnoremap <leader>t :sp<Bar>resize 15<Bar>term<CR>
au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
au FileType fzf tunmap <buffer> <Esc>

" remap fzf commands
if has_key(plugs, 'fzf.vim')
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>F :Files ~<CR>
endif


" remap startify session saving and loading
if has_key(plugs, 'vim-startify')
  " save current session
  nnoremap <leader>ss :SSave!<CR>
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

if has_key(plugs, 'defx.nvim')
  nnoremap <leader>e :Defx -split=vertical -winwidth=25 -direction=botright<CR>

  autocmd FileType defx call s:defx_key_mappings()

  function! s:defx_key_mappings() abort
    " Define file explorer operations
    nnoremap <silent><buffer><expr> <CR>
      \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
      \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
      \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
      \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
      \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
      \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
      \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
      \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
      \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
      \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
      \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
      \ defx#do_action('toggle_columns',
      \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
      \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
      \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
      \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
      \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
      \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
      \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
      \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
      \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
      \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
      \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
      \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
      \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
      \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
      \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
      \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
      \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
      \ defx#do_action('change_vim_cwd')
  endfunction
endif

