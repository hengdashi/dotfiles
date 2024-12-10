return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    -- merging list is not possible, list must be overwritten
    ensure_installed = {
      'bash',
      'comment',
      'dockerfile',
      'go',
      'latex',
      'lua',
      'json',
      'markdown',
      'markdown_inline',
      'python',
      'toml',
      'yaml',
      'vim',
    },
  },
}
