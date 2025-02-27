return {
  "princejoogie/dir-telescope.nvim",
  -- telescope.nvim is a required dependency
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>sv",
      "<cmd>Telescope dir live_grep<cr>",
      desc = "Telescope Grep in Directory",
    },
  },
}
