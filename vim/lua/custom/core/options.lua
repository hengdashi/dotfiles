-- core/options.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--

local opt = vim.opt
local g = vim.g


-- leader key
g.mapleader = ' '
g.maplocalleader = ','


-- autosave
g.auto_save = true


-- indentation
opt.autoindent  = true  -- indent according to previous line
opt.expandtab   = true  -- use spaces instead of tabs
opt.smarttab    = true  -- insert “tabstop” number of spaces when the “tab” key is pressed
opt.tabstop     = 2     -- tab key indents by 2
opt.softtabstop = 2     -- tab key indents by 2 in edit mode
opt.shiftwidth  = 2     -- >> indents by 2
opt.shiftround  = true  -- >> indents to next multiple of 'shiftwidth'


-- line rendering
opt.wrap           = true  -- wrap line
opt.linebreak      = true  -- enable linebreak
opt.showbreak      = '↪'   -- show linebreak symbol
opt.number         = true  -- add line numbers
opt.relativenumber = true  -- show relative line number
opt.cursorline     = true  -- find current line quickly
opt.wrapscan       = true  -- wrap searches
opt.showmatch      = true  -- show matching brackets


-- general display
opt.title         = true        -- set window title
opt.laststatus    = 2           -- always show statusline
-- opt.showtabline   = 2           -- always show tabline
opt.signcolumn    = 'yes'       -- always show sign column
opt.showmode      = false       -- not show current mode in command-line (shown by statusline)
opt.showcmd       = true        -- show already typed keys when more are expected
opt.ttyfast       = true        -- faster redrawing
opt.lazyredraw    = true        -- only redraw when necessary
opt.splitbelow    = true        -- open new windows below
opt.splitright    = true        -- open new windows on the right
opt.termguicolors = true        -- make sure the gui is in colors
opt.synmaxcol     = 800         -- only highlight the first 800 columns
opt.display:append('lastline')  -- always try to display the paragraph's last line


-- search
opt.incsearch = true   -- highlight while searching with / or ?
opt.hlsearch  = true   -- keep matches highlighted
opt.ignorecase = true  -- case insensitive matching when searching
opt.smartcase  = true  -- smart case matching when searching


-- typing experience
opt.hidden = true                     -- switch between buffers without having to save first
opt.mouse:append('a')                 -- allow mouse to scroll
opt.whichwrap:append('<>[]hl')        -- allow h, l to other line at beginning and end of the line
opt.clipboard:prepend('unnamedplus')  -- use system clipboard on macos and linux


-- sound
opt.errorbells = false  -- disable sound bell
opt.visualbell = true   -- enable visual bell


-- timeout
opt.report     = 0    -- always report changed lines
opt.timeoutlen = 400  -- command timeout interval
opt.updatetime = 250  -- update async interval


-- implicit characters
opt.list = true

-- utf-8
opt.listchars = {
 eol = '',
 tab = '',
 trail = 'ﰣ',
 extends = '❯',
 precedes = '❮',
 nbsp = '±',
 space = '·',
}
-- ascii only
-- opt.listchars = {
--   eol = '$',
--   tab = '>-',
--   trail = '~',
--   extends = '>',
--   precedes = '<',
--   nbsp = '-',
-- }

-- disable
opt.wildignore = { '*.o', '*.a', '__pycache__' }  -- ignore object, lib, pycache


-- file extension specific tabbing
vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
