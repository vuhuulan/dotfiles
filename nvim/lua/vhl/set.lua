vim.opt.guicursor = ""

vim.opt.mouse = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.keymap.set('n', '<Space>', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-left>', ':vertical resize -3<CR>')     --resize window
vim.keymap.set('n', '<C-right>', ':vertical resize +3<CR>')
vim.keymap.set('n', '<C-up>', ':resize +3<CR>')
vim.keymap.set('n', '<C-down>', ':resize -3<CR>')

local comment = vim.api.nvim_create_augroup("comment_out", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.py",
    group = vim.api.nvim_create_augroup("comment_out", { clear = true }),
    command = "I#<esc>"
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.lua",
    group = comment, 
    callback = function() vim.keymap.set('n', '<localleader>c', 'I--<esc>') end
})
