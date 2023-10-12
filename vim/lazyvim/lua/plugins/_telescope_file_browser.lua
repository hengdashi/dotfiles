return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>fe",
      "<cmd>Telescope file_browser<cr>",
      desc = "Telescope Explorer (root dir)",
    },
    {
      "<leader>fE",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
      desc = "Telescope Explorer (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Telescope Explorer (root dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Telescope Explorer (cwd)",      remap = true },
  },
}
