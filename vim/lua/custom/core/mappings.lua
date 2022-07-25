-- core/mappings.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--


local M = {}

M.general = {
  -- modes
  --   normal_mode = "n",
  --   insert_mode = "i",
  --   visual_mode = "v",
  --   visual_block_mode = "x",
  --   term_mode = "t",
  --   command_mode = "c",
  n = {
    -- go to  beginning and end
    ['<C-b>'] = { '<ESC>^i', ' beginning of line' },
    ['<C-e>'] = { '<End>', ' end of line' },

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
    -- stay in indent mode
    ['<'] = { '<gv', 'indent left' },
    ['>'] = { '>gv', 'indent right' },
    -- stop p from yanking replaced text
    ['p'] = { '"_dP', 'paste text' }
  },
  x = {
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
        require('Comment.api').toggle_current_linewise()
      end,
      '  toggle comment',
    },
    ['<leader>/'] = {},
  },
  v = {
    ['<leader>c<leader>'] = {
      '<ESC><cmd>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',
      '  toggle comment',
    },
    ['<leader>/'] = {},
  },
}

M.tabufline = {
  n = {
    -- new buffer
    ['<S-b>'] = { '<cmd> enew <CR>', '  new buffer' },
    ['<leader>q'] = {
      function()
        require('core.utils').close_buffer()
      end,
      '  close buffer',
    },
    ['<leader>x'] = {},
  },
}

M.lspconfig = {
  n = {
    ['<leader>g'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      '  diagnostic setloclist'
    },
  },
}

M.telescope = {
  n = {
    -- find
    ['<leader>ff'] = { '<cmd> Telescope find_files <CR>', '  find files' },

    ['<leader>fp'] = { '<cmd> Telescope persisted <CR>', '  Find Project'},
    ['<leader>fa'] = { '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', '  find all' },
    ['<leader>fw'] = { '<cmd> Telescope live_grep <CR>', '  live grep' },
    ['<leader>fb'] = { '<cmd> Telescope buffers <CR>', '  find buffers' },
    ['<leader>fo'] = { '<cmd> Telescope oldfiles <CR>', '  find oldfiles' },
  },
}

return M
