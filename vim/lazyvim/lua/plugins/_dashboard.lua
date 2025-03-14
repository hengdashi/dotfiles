return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { action = ":ene | startinsert", desc = " New File", icon = "󰎔  ", key = "n" },
          { action = ":SessionSearch", desc = " Restore Session", icon = "  ", key = "s" },
          { action = ":Telescope find_files", desc = " Find File", icon = "󰥨  ", key = "f" },
          { action = ":Telescope live_grep", desc = " Live Grep", icon = "  ", key = "g" },
          { action = ":Telescope oldfiles", desc = " Recent File", icon = "  ", key = "r" },
          { action = ":Telescope marks", desc = " Bookmarks", icon = "󰸕  ", key = "m" },
        },
      },
    },
  },
}
