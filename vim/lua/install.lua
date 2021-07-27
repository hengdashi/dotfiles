#! /usr/bin/env lua
--
-- install.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--

vim.g.os = vim.fn.system('uname')

local present, _ = pcall(require, "plugins.packer.init")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return packer.startup(
    function()
