#! /usr/bin/env lua
--
-- lua/keymappings.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--

local opt = vim.opt
local g = vim.g

-- change leader keys
g.mapleader = "\<Space>"
g.maplocalleader = ","

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
-- map("v", "x", [=[ "_x ]=], opt)


-- Try to prevent bad habits like using the arrow keys for movement. This is
-- not the only possible bad habit. For example, holding down the h/j/k/l keys
-- for movement, rather than using more efficient movement commands, is also a
-- bad habit. The former is enforceable through a .vimrc, while we don't know
-- how to prevent the latter.
-- Do this in normal mode...
map("n", "<Left>",  ':echoe "Use h"<CR>', opt)
map("n", "<Right>", ':echoe "Use l"<CR>', opt)
map("n", "<Up>",    ':echoe "Use k"<CR>', opt)
map("n", "<Down>",  ':echoe "Use j"<CR>', opt)
-- ...and in insert mode
map("i", "<Left>",  ':echoe "Use h"<CR>', opt)
map("i", "<Right>", ':echoe "Use l"<CR>', opt)
map("i", "<Up>",    ':echoe "Use k"<CR>', opt)
map("i", "<Down>",  ':echoe "Use j"<CR>', opt)

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- move between tabs
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)

-- use ESC to turn off search highlight
map("n", "<Esc>", ":noh <CR>")


-- nvim-comment
if packer_plugins['nvim-comment'] and packer_plugins['nvim-comment'].loaded then
    map("n", "<LEADER>c<LEADER>", ":CommentToggle<CR>", opt)
    map("v", "<LEADER>c<LEADER>", ":CommentToggle<CR>", opt)
end


-- telescope
if packer_plugins['telescope.nvim'] and packer_plugins['telescope.nvim'].loaded then
    map("n", "<LEADER>ff", ":Telescope find_files<CR>", opt)
    map("n", "<LEADER>fg", ":Telescope live_grep<CR>", opt)
    map("n", "<LEADER>fb", ":Telescope buffers<CR>", opt)
    map("n", "<LEADER>fh", ":Telescope help_tags<CR>", opt)
end
