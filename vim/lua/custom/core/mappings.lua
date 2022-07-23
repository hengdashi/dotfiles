-- core/mappings.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--


local M = {}

M.general = {
  n = {
    -- Try to prevent bad habits like using the arrow keys for movement. This is
    -- not the only possible bad habit. For example, holding down the h/j/k/l keys
    -- for movement, rather than using more efficient movement commands, is also a
    -- bad habit. The former is enforceable through a .vimrc, while we don't know
    -- how to prevent the latter.
    ['<Left>'] = { '<cmd> :echoe "Use h" <CR>', 'arrow key disabled' },
    ['<Right>'] = { '<cmd> :echoe "Use l" <CR>', 'arrow key disabled' },
    ['<Up>'] = { '<cmd> :echoe "Use k" <CR>', 'arrow key disabled' },
    ['<Down>'] = { '<cmd> :echoe "Use j" <CR>', 'arrow key disabled' },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ['j'] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
    ['k'] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },

    -- move between tabs
    -- ['<TAB>'] = { '<cmd> :BufferLineCycleNext <CR>', 'switch to next tab' },
    -- ['<S-TAB>'] = { '<cmd> :BufferLineCyclePrev <CR>', 'switch to prev tab' },

    -- use ESC to turn off search highlight
    ['<Esc>'] = { '<cmd> :noh <CR>', 'turn off search highlight' },
  },
  v = {
  },
  i = {
    ['<Left>'] = { '<cmd> :echoe "Use h" <CR>', 'arrow key disabled' },
    ['<Right>'] = { '<cmd> :echoe "Use l" <CR>', 'arrow key disabled' },
    ['<Up>'] = { '<cmd> :echoe "Use k" <CR>', 'arrow key disabled' },
    ['<Down>'] = { '<cmd> :echoe "Use j" <CR>', 'arrow key disabled' },
  },
}


M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>c<leader>"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,

      "蘒  toggle comment",
    },
  },

  v = {
    ["<leader>c<leader>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
      "蘒  toggle comment",
    },
  },
}

return M
