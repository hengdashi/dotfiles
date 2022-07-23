return {
  ['goolord/alpha-nvim'] = {
    after = 'base46',
    require = { 'kyazdani42/nvim-web-devicons' },
    disable = false,
  },
  ['olimorris/persisted.nvim'] = {
    module = "persisted", -- For lazy loading
    config = function()
      require("persisted").setup()
      -- To load the telescope extension
      require("telescope").load_extension("persisted")
    end,
  },
}
