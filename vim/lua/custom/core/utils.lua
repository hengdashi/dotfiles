-- core/utils.lua
-- Copyright (C) 2021 Hengda Shi <hengda.shi@cs.ucla.edu>
--
-- Distributed under terms of the MIT license.
--

-- hide line numbers and statusline in specific buffers
vim.api.nvim_exec(
    [[
        au TermOpen term://* setlocal nonumber  laststatus=0
        au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
    ]],
    false
)
