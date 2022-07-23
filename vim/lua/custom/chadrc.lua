local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = 'onedark',
}

M.options = {
  user = function()
    require('custom.core.options')
  end,
}

M.mappings = require('custom.core.mappings')

M.plugins = {
  user = require('custom.plugins'),
  override = {
    ['NvChad/ui'] = require('custom.plugins.configs.ui').overrides,
    ['kyazdani42/nvim-tree'] = require('custom.plugins.configs.nvimtree').overrides,
    ['nvim-treesitter/nvim-treesitter'] = require('custom.plugins.configs.treesitter').overrides,
    ['lukas-reineke/indent-blankline.nvim'] = require('custom.plugins.configs.indent_blankline').overrides,
  },
}

return M
