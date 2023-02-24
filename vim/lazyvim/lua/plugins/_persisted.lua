return {
    'olimorris/persisted.nvim',
    opts = {
        use_git_branch = true,
        should_autosave = function()
          if vim.bo.filetype == "alpha" then return false end
          return true
        end,
    },
    config = function(_, opts)
      require('persisted').setup(opts)
      require("telescope").load_extension("persisted") -- To load the telescope extension
    end,
}
