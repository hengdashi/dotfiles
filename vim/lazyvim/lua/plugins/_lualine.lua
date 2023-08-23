return {
  'nvim-lualine/lualine.nvim',
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        return require("util.dashboard").status()
      end,
    })
    opts.options['component_separators'] = '|'
    opts.options['section_separators'] = ''
  end,
}
