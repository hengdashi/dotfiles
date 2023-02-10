-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here


-- file extension specific tabbing
-- local python_group = vim.api.nvim_create_augroup(
--   'PythonOptions', { clear = true }
-- )
-- vim.api.nvim_create_autocmd(
--   'Filetype python', { command = 'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4', group=python_group }
-- )
