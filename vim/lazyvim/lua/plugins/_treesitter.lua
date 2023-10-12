return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
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
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.d2 = {
        install_info = {
          url = 'https://github.com/pleshevskiy/tree-sitter-d2',
          revision = 'main',
          files = { 'src/parser.c', 'src/scanner.cc' },
        },
        filetype = 'd2',
      }
    end,
  },
}
