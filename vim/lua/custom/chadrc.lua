local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = 'onedark',
}

M.mappings = require('custom.core.mappings')

M.plugins = {
  -- custom plugins installation
  user = require('custom.plugins'),
  -- plugins config override
  override = {
    ['goolord/alpha-nvim'] = require('custom.plugins.configs._alpha').options,
    ['lukas-reineke/indent-blankline.nvim'] = require('custom.plugins.configs._indent_blankline').options,
    ['williamboman/mason'] = require('custom.plugins.configs._mason').options,
    ['kyazdani42/nvim-tree'] = require('custom.plugins.configs._nvimtree').options,
    ['nvim-treesitter/nvim-treesitter'] = require('custom.plugins.configs._treesitter').options,
    ['olimorris/persisted.nvim'] = require('custom.plugins.configs._persisted').options,
    ['nvim-telescope/telescope.nvim'] = require('custom.plugins.configs._telescope').options,
    ['NvChad/ui'] = require('custom.plugins.configs._ui').options,
  },
}

return M
