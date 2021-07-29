#! /usr/bin/env lua
--
-- lua/mappings.lua
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
map("", "j", 'v:count ? "j" : "gj"', {expr = true})
map("", "k", 'v:count ? "k" : "gk"', {expr = true})

-- move between tabs
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)


if packer_plugins['nvim-comment'] and packer_plugins['nvim-comment'].loaded then
    map("n", "<LEADER>c<LEADER>", ":CommentToggle<CR>", opt)
    map("v", "<LEADER>c<LEADER>", ":CommentToggle<CR>", opt)
end
