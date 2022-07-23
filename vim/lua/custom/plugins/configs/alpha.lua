local M = {}

M.buttons = {
  type = 'group',
  val = {
    button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
    button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
    button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
    button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
    button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
    button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
  },
}

return M
