-- vim.o.background = 'light'
require('gruvbox').setup({
    contrast = 'hard',
})
vim.cmd([[colorscheme gruvbox]])
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })  -- remove bg of SignColumn (left of number colomn)
