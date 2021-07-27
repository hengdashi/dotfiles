" =============================================================================
" dracula
" =============================================================================

if has_key(plugs, 'dracula')
  " Remove the non-transparent background
  let g:dracula_colorterm = 0

  function SetupCursorLine() abort
    hi clear CursorLine
    hi CursorLine cterm=underline term=underline gui=underline guisp=white
  endfunction

  augroup dracula_customization
    au!
    " autocmds...
    autocmd ColorScheme dracula call SetupCursorLine()
  augroup END

  set termguicolors
  colorscheme dracula
endif


" =============================================================================
" coc.nvim
" =============================================================================

if has_key(plugs, 'coc.nvim')
  " TextEdit might fail if hidden is not set.
  set hidden

  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
  if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " " Show all diagnostics.
  " nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " " Manage extensions.
  " nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " " Show commands.
  " nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " " Find symbol of current document.
  " nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " " Search workspace symbols.
  " nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " " Do default action for next item.
  " nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " " Resume latest coc list.
  " nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif


" =============================================================================
" lightline.vim
" =============================================================================

if has_key(plugs, 'lightline.vim')
"   autocmd VimEnter * call SetupLightlineColors()
"   function SetupLightlineColors() abort
"     " transparent background in statusbar
"     let l:palette = lightline#palette()
" 
"     let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
"     let l:palette.inactive.middle = l:palette.normal.middle
"     let l:palette.tabline.middle = l:palette.normal.middle
" 
"     call lightline#colorscheme()
"   endfunction

  let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'cocstatus', 'currentfunction' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['tabs'] ],
      \   'right': []
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'readonly', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'readonly', 'filename', 'modified' ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'cocstatus':       'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'readonly':        'LightlineReadonly',
      \   'fugitive':        'LightlineFugitive',
      \   'filetype':        'DeviconsFiletype',
      \   'fileformat':      'DeviconsFileformat'
      \ }
  \ }

  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  function! DeviconsFiletype()
    if exists('*WebDevIconsGetFileTypeSymbol')
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
    endif
    return ''
  endfunction

  function! DeviconsFileformat()
    if exists('*WebDevIconsGetFileFormatSymbol')
        return winwidth(0) > 70 ? WebDevIconsGetFileFormatSymbol() : ''
    endif
    return ''
  endfunction

  function! LightlineReadonly()
    return &readonly ? '' : ''
  endfunction
  function! LightlineFugitive()
    if exists('*FugitiveHead')
      let branch = FugitiveHead()
      return branch !=# '' ? ''.branch : ''
    endif
    return ''
  endfunction
endif


" =============================================================================
" fzf
" =============================================================================

if has_key(plugs, 'fzf')
  " An action can be a reference to a function that processes selected lines
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  " actions
  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'enter': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  set wildmode=list:longest,list:full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

  " Move to right panel
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(20)
    " let width = float2nr(200)
    let width = float2nr(&columns)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 1

    let opts = {
          \ 'relative': 'editor',
          \ 'row': vertical,
          \ 'col': horizontal,
          \ 'width': width,
          \ 'height': height,
          \ 'style': 'minimal'
          \ }

    call nvim_open_win(buf, v:true, opts)
  endfunction

  " ripgrep
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  endif

  let $FZF_DEFAULT_OPTS = "--color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7 --layout=reverse --margin=1,4 --preview-window 'right:50%' --preview 'bat --theme='Dracula' --style=changes --color always {}'"

  " Customize fzf colors to match your color scheme
  " - fzf#wrap translates this to a set of `--color` options
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " Enable per-command history
  " - History files will be stored in the specified directory
  " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
  "   'previous-history' instead of 'down' and 'up'.
  let g:fzf_history_dir = '~/.local/share/fzf-history'
endif


" =============================================================================
" startify
" =============================================================================

if has_key(plugs, 'vim-startify')
  " reorder list
  let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
  " update session automatically as you exit vim
  let g:startify_session_presistence = 1
  " make startify use unicode
  let g:startify_fortune_use_unicode = 1
  " sort sessions by modification time
  let g:startify_session_sort = 1
  " autoload session when in a directory that has session
  let g:startify_session_autoload = 1
endif


" =============================================================================
" indentLine
" =============================================================================

if has_key(plugs, 'indentLine')
  let g:indentLine_char_list = ['¦', '┊']
  let g:indentLine_conceallevel = 1
endif


" =============================================================================
" rainbow
" =============================================================================

if has_key(plugs, 'rainbow')
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \ 'guifgs': ['yellow', 'cyan', 'orange', 'pink']
  \}
endif


" =============================================================================
" nerdCommenter
" =============================================================================

if has_key(plugs, 'nerdcommenter')
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left
  let g:NERDDefaultAlign = 'left'
  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
endif


" =============================================================================
" ale
" =============================================================================

if has_key(plugs, 'ale')
  let g:ale_fix_on_save = 1
endif


" =============================================================================
" defx.nvim
" =============================================================================


" =============================================================================
" lens
" =============================================================================
if has_key(plugs, 'lens.vim')
  let g:lens#disabled_filetypes = ['defx', 'terminal']
endif


" =============================================================================
" languages
" =============================================================================

" latex config
if has_key(plugs, 'vimtex')
  let g:tex_flavor = 'latex'
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_compiler_method = 'latexmk'
  let g:vimtex_quickfix_autoclose_after_keystrokes = 1
  let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_syntax_conceal_default = 0
endif

" markdown config
if has_key(plugs, 'vim-polyglot')
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_conceal_code_blocks = 0
endif

" json config
if has_key(plugs, 'vim-polyglot')
  let g:vim_json_syntax_conceal = 0
endif

" templates config
if has_key(plugs, 'vim-template')
  let g:username = 'Hengda Shi'
  let g:email    = 'hengdas@ziprecruiter.com'
endif

