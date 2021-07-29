#! /usr/bin/env lua
--
-- init.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--
-- entry point where all modules are loaded

local modules = {
  "basics",
  "install",
  "mappings",
  "utils"
}

for _, m in ipairs(modules) do
  pcall(require, m)
end
