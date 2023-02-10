-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

--------------------------------------
-- normal mode start                --
--------------------------------------

-- go to  beginning and end
map('n', '<C-b>', '<ESC>^i', { desc = ' beginning of line' })
map('n', '<C-e>', '<End>', { desc = ' end of line' })

-- Try to prevent bad habits like using the arrow keys for movement. This is
-- not the only possible bad habit. For example, holding down the h/j/k/l keys
-- for movement, rather than using more efficient movement commands, is also a
-- bad habit. The former is enforceable through a .vimrc, while we don't know
-- how to prevent the latter.
map('n', '<Left>', '<cmd> :echoe "Use h" <CR>', { desc = 'arrow key disabled' })
map('n', '<Right>', '<cmd> :echoe "Use l" <CR>', { desc = 'arrow key disabled' })
map('n', '<Up>', '<cmd> :echoe "Use k" <CR>', { desc = 'arrow key disabled' })
map('n', '<Down>', '<cmd> :echoe "Use j" <CR>', { desc = 'arrow key disabled' })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- move between tabs
if Util.has('bufferline.nvim') then
  map('n', '<TAB>', '<cmd> BufferLineCycleNext <CR>', { desc = 'switch to next tab' })
  map('n', '<S-TAB>', '<cmd> BufferLineCyclePrev <CR>', { desc = 'switch to prev tab' })
else
  map('n', '<TAB>', '<cmd> bprevious <CR>', { desc = 'switch to next tab' })
  map('n', '<S-TAB>', '<cmd> bnext <CR>', { desc = 'switch to prev tab' })
end


-- use ESC to turn off search highlight
map('n', '<Esc>', '<cmd> :noh <CR>', { desc = 'turn off search highlight' })

--------------------------------------
-- normal mode end                  --
--------------------------------------


--------------------------------------
-- visual mode start                --
--------------------------------------

-- stay in indent mode
map('v', '<', '<gv', { desc = 'indent left' })
map('v', '>', '>gv', { desc = 'indent right' })
-- stop p from yanking replaced text
map('v', 'p', '"_dP', { desc = 'paste text' })

--------------------------------------
-- visual mode end                  --
--------------------------------------


--------------------------------------
-- insert mode start                --
--------------------------------------

map('i', '<Left>', '<cmd> :echoe "Use h" <CR>', { desc = 'arrow key disabled' })
map('i', '<Right>', '<cmd> :echoe "Use l" <CR>', { desc = 'arrow key disabled' })
map('i', '<Up>', '<cmd> :echoe "Use k" <CR>', { desc = 'arrow key disabled' })
map('i', '<Down>', '<cmd> :echoe "Use j" <CR>', { desc = 'arrow key disabled' })

--------------------------------------
-- insert mode end                  --
--------------------------------------
