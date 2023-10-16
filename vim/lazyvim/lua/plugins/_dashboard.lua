return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      center = {
        { action = "ene | startinsert", desc = " New File", icon = "󰎔  ", key = "n" },
        { action = "Telescope persisted", desc = " Restore Session", icon = "  ", key = "s" },
        { action = "Telescope find_files", desc = " Find File", icon = "󰥨  ", key = "f" },
        { action = "Telescope live_grep", desc = " Live Grep", icon = "  ", key = "g" },
        { action = "Telescope oldfiles", desc = " Recent File", icon = "  ", key = "r" },
        { action = "Telescope marks", desc = " Bookmarks", icon = "󰸕  ", key = "m" },
      },
    },
  },
}
