return {
  "williamboman/mason.nvim",
  opts = {
    -- merging list is not possible, list must be overwritten
    ensure_installed = {
      -- lsp
      "lua-language-server",
      "json-lsp",
      -- dap
      -- linter
      "buf",
      "ruff",
      -- formatter
      "stylua",
    },
  },
}
