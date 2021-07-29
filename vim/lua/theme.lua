#! /usr/bin/env lua
--
-- theme.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--

vim.g.theme = "onedark"

local present, base16 = pcall(require, "base16")

if present then
    base16(base16.themes[vim.g.theme], true)
    require "hightlights"
    return true
else
    return false
end
