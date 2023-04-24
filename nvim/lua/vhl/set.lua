local opts = { noremap = true, silent = true }

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
--vim.cmd('hi SignColumn guibg=none')
--vim.cmd('hi clear DiagnosticSignError')
--vim.api.nvim_set_hl(0, 'DiagnosticSignError', {bg='NONE'})
vim.api.nvim_set_hl(0, 'SignColumn', {bg='NONE'})

vim.keymap.set('n', '<Space>', vim.cmd.nohlsearch, opts)
vim.keymap.set('n', '<C-left>', ':vertical resize -3<CR>', opts)     --resize window
vim.keymap.set('n', '<C-right>', ':vertical resize +3<CR>', opts)
vim.keymap.set('n', '<C-up>', ':resize +3<CR>', opts)
vim.keymap.set('n', '<C-down>', ':resize -3<CR>', opts)

local comment = vim.api.nvim_create_augroup("comment_out", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.py",
    group = comment,
    callback = function() vim.keymap.set('n', '<localleader>c', 'I--<esc>') end
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.lua",
    group = comment,
    callback = function() vim.keymap.set('n', '<localleader>c', 'I--<esc>') end
})
