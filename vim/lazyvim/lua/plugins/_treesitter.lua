return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    -- merging list is not possible, list must be overwritten
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'comment',
      'cuda',
      'dockerfile',
      'go',
      'latex',
      'lua',
      'json',
      'make',
      'markdown',
      'markdown_inline',
      'python',
      'toml',
      'yaml',
      'vim',
    },
  },
}
