return {
  'nvim-telescope/telescope.nvim',
  keys = {
    { "<leader>/", Util.telescope("live_grep"), desc = "  Find in Files (Grep)" },
    { "<leader>ff", Util.telescope("files"), desc = "  Find Files (root dir)" },
    { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "  Find Files (cwd)" },
    { "<leader>sg", Util.telescope("live_grep"), desc = "  Grep (root dir)" },
    { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "  Grep (cwd)" },
    { "<leader>sw", Util.telescope("grep_string"), desc = "  Word (root dir)" },
    { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "  Word (cwd)" },
  },
  opts = {
    defaults = {
      prompt_prefix = '   ',
    },
    extensions_list = { 'themes', 'terms', 'persisted', 'fzf' },
  },
}
