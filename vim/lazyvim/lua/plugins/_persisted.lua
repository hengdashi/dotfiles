return {
    'olimorris/persisted.nvim',
    opts = {
        use_git_branch = true,
    },
    config = function(_, opts)
      require('persisted').setup(opts)
      require("telescope").load_extension("persisted") -- To load the telescope extension
    end,
}
