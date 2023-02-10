local function button(sc, txt, keybind)
  local sc_ = sc:gsub('%s', ''):gsub('SPC', '<leader>')

  local opts = {
    position = 'center',
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = 'right',
    hl = 'AlphaButtons',
  }

  if keybind then
    opts.keymap = { 'n', sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = 'button',
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, 'normal', false)
    end,
    opts = opts,
  }
end


return {
  {
    'goolord/alpha-nvim',
    opts = function()
      dashboard.section.buttons.val = {
        button('<S-b>',   '  New File', ':enew <CR>'),
        button('SPC f p', '  Find Project', ':Telescope persisted <CR>'),
        button('SPC f f', '  Find File  ', ':Telescope find_files <CR>'),
        button('SPC f o', '  Recent File  ', ':Telescope oldfiles <CR>'),
        button('SPC f w', '  Find Word  ', ':Telescope live_grep <CR>'),
        button('SPC b m', '  Bookmarks  ', ':Telescope marks <CR>'),
        button('SPC t h', '  Themes  ', ':Telescope themes <CR>'),
        button('SPC e s', '  Settings', ':e $MYVIMRC | :cd %:p:h <CR>'),
      }
    end
  },
}
