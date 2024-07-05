local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local commentOut = augroup("CommentOut", { clear = true })
autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.py",
    group = commentOut,
    callback = function() vim.keymap.set('n', '<localleader>c', 'I#<esc>') end
})
autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.lua",
    group = commentOut,
    callback = function() vim.keymap.set('n', '<localleader>c', 'I--<esc>') end
})

-- windows close with 'q'
autocmd("FileType", {
    pattern = { "help", "qf" },
    command = [[nnoremap <buffer><silent> q :close<CR>]]
})

-- auto formatting on save
autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})

-- set textwidt=80 for markdown
autocmd("FileType", {
    pattern = "markdown",
    command = [[set textwidth=80]]
})
