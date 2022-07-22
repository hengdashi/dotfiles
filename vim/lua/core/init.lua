#! /usr/bin/env lua
--
-- core/init.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--
-- entry point where all modules are loaded

local modules = {
  "core.settings",
  "core.keymappings",
  "core.utils"
}

local hooks = require "core.hooks"

for _, m in ipairs(modules) do
  local ok, err = pcall(require, m)
  if not ok then
    error("Error loading " .. m .. "\n\n" .. err)
  end
end

hooks.run "ready"
