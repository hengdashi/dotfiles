return {
  'nvim-telescope/telescope.nvim',
  keys = {
  },
  opts = {
    defaults = {
      prompt_prefix = '  ',
    },
    extensions_list = { 'themes', 'terms', 'fzf', 'dir' },
    extensions = {
      file_browser = {
        hidden = {
          file_browser = true,
          folder_browser = true
        }
      }
    }
  },
}
