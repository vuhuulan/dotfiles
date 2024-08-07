require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pylsp" }
})

local on_attach = function(_, _)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" , "nvim_set_keymap" },
            },
        },
    },
}

require("lspconfig").pylsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {"E741"},
                    maxLineLength = 100,
                    hangClosing = false,
                }
            }
        }
    }
}

require("lspconfig").clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").nil_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").bashls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

