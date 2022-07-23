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
    ['NvChad/ui'] = require('custom.plugins.ui').overrides,
    ['kyazdani42/nvim-tree'] = require('custom.plugins.nvimtree').overrides,
    ['nvim-treesitter/nvim-treesitter'] = require('custom.plugins.treesitter').overrides,
    ['lukas-reineke/indent-blankline.nvim'] = require('custom.plugins.indent_blankline').overrides,
  },
}

return M
