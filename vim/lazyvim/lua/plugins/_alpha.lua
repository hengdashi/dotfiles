local dashboard = require("alpha.themes.dashboard")

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
              dashboard.button('<S-b>', '  New File', ':enew <CR>'),
              dashboard.button('<leader> f p', '  Find Project', ':Telescope persisted <CR>'),
              dashboard.button('<leader> f f', '  Find File  ', ':Telescope find_files <CR>'),
              dashboard.button('<leader> f o', '  Recent File  ', ':Telescope oldfiles <CR>'),
              dashboard.button('<leader> f w', '  Find Word  ', ':Telescope live_grep <CR>'),
              dashboard.button('<leader> b m', '  Bookmarks  ', ':Telescope marks <CR>'),
          }
        end
    },
}
