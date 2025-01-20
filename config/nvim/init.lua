require("dev.lazy")

vim.opt.relativenumber = true

vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'gri', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('v', 'gra', vim.lsp.buf.code_action)
