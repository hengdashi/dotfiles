return {
  'olimorris/persisted.nvim',
  opts = {
    use_git_branch = true,
    telescope = {
      before_source = function()
        -- Close all open buffers
        -- Thanks to @avently
        vim.api.nvim_input("<ESC>:%bd<CR>")
      end,
      after_source = function(session)
        print("Loaded session " .. session.name)
      end,
    },
  },
}
