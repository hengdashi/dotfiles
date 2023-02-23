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


local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedTelescopeLoadPre",
    group = group,
    callback = function()
      -- Close and delete all open buffers
      vim.api.nvim_input("<ESC>:%bd<CR>")
    end,
})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedTelescopeLoadPost",
    group = group,
    callback = function(session)
      local status_ok, notify = pcall(require, 'notify')
      if status_ok then
        notify(
            'Loaded session' .. session.name,
            vim.log.levels.INFO,
            { title = 'Persisted Session' }
        )
      else
        print("Loaded session " .. session.name)
      end
    end,
})
