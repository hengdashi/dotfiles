return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { '<leader>fp', '<cmd> Telescope persisted <CR>', desc = 'Find Projects' },
  },
  opts = {
    defaults = {
      prompt_prefix = '   ',
    },
    extensions_list = { 'themes', 'terms', 'persisted', 'fzf' },
  },
}
