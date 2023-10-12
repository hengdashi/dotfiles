return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { '<leader>fp', '<cmd> Telescope persisted <CR>', desc = 'Find Projects' },
  },
  opts = {
    defaults = {
      prompt_prefix = '  ',
    },
    extensions_list = { 'themes', 'terms', 'persisted', 'fzf' },
  },
}
