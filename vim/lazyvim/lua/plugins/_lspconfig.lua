return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
          basedpyright = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      },
    },
  },
}
