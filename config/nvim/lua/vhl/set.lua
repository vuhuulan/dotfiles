local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local opts = { noremap = true, silent = true }
local autoFormat = augroup("AutoFormat", { clear = true })

vim.g.mapleader = ','

--vim.opt.background = 'dark' -- comment out due to being handle by vim-unimpare
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.signcolumn = 'yes:1'

vim.keymap.set('n', '<C-left>', ':vertical resize -3<CR>', opts) --resize window
vim.keymap.set('n', '<C-right>', ':vertical resize +3<CR>', opts)
vim.keymap.set('n', '<C-up>', ':resize +3<CR>', opts)
vim.keymap.set('n', '<C-down>', ':resize -3<CR>', opts)
vim.keymap.set('n', '<Space>', ':nohlsearch|diffupdate|normal! <C-L><CR>', opts)

-- windows close with 'q'
autocmd("FileType", {
    pattern = { "help", "qf" },
    -- command = [[nnoremap <buffer><silent> q :close<CR>]],
    callback = function()
        opts.buffer = 0
        vim.keymap.set('n', 'q', ':close<CR>', opts)
    end
})

-- auto formatting on save
autocmd("BufWritePost", {
    buffer = vim.api.nvim_get_current_buf(),
    group = autoFormat,
    command = [[:%s/\s\+$//e]]
})

autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    group = autoFormat,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})

-- set textwidt=80 for markdown
autocmd("FileType", {
    pattern = "markdown",
    command = [[set textwidth=80]]
})
