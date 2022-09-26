local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "chadracula",
}

M.mappings = require('custom.core.mappings')

M.plugins = {
  -- dashboard
  ['goolord/alpha-nvim'] = {
    after = 'base46',
    require = { 'kyazdani42/nvim-web-devicons' },
    disable = false,
    override_options = require('custom.plugins.configs._alpha').options,
  },
  ['lukas-reineke/indent-blankline.nvim'] = {
    override_options = require('custom.plugins.configs._indent_blankline').options,
  },
  ['williamboman/mason.nvim'] = {
    override_options = require('custom.plugins.configs._mason').options,
  },
  -- smooth scroll
  ['karb94/neoscroll.nvim'] = {
    config = function()
      require('neoscroll').setup()
    end,
  },
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require('plugins.configs.lspconfig')
      require('custom.plugins.configs._lspconfig')
    end,
  },
  ['kyazdani42/nvim-tree'] = {
    override_options = require('custom.plugins.configs._nvimtree').options,
  },
  ['nvim-treesitter/nvim-treesitter'] = {
    override_options = require('custom.plugins.configs._treesitter').options,
  },
  -- session management
  ['olimorris/persisted.nvim'] = {
    -- module = "persisted", -- For lazy loading
    config = function()
      require('persisted').setup()
    end,
    override_options = require('custom.plugins.configs._persisted').options,
  },
  ['nvim-telescope/telescope.nvim'] = {
    override_options = require('custom.plugins.configs._telescope').options,
  },
  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    run = 'make',
    override_options = require('custom.plugins.configs._telescope_fzf_native').options,
  },
  ['folke/which-key.nvim'] = {
    disable = false,
  },
  ['NvChad/ui'] = {
    override_options = require('custom.plugins.configs._ui').options,
  },
}

return M
