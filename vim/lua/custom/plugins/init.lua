return {
  -- dashboard
  ['goolord/alpha-nvim'] = {
    after = 'base46',
    require = { 'kyazdani42/nvim-web-devicons' },
    disable = false,
  },
  -- session management
  ['olimorris/persisted.nvim'] = {
    -- module = "persisted", -- For lazy loading
    config = function()
      require('persisted').setup()
    end,
  },
  -- smooth scroll
  ['karb94/neoscroll.nvim'] = {
    config = function()
      require('neoscroll').setup()
    end,
  },
  ["neovim/nvim-lspconfig"] = {
      config = function()
        require('plugins.configs.lspconfig')
        require('custom.plugins.configs._lspconfig')
      end,
  },
}
