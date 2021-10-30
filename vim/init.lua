#! /usr/bin/env lua
--
-- init.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--
-- entry point where all modules are loaded
--

local ok, err = pcall(require, "core")

if not ok then
  error("Error loading core" .. "\n\n" .. err)
end
