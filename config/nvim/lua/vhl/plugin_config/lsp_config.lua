-- copy from jdhao's nvim setup
-- https://github.com/jdhao/nvim-config/blob/main/lua/config/lsp.lua


require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pylsp" }
})


local keymap = vim.keymap
local diagnostic = vim.diagnostic
local fn = vim.fn


function _G.inspect(item)
  vim.print(item)
end


local set_qflist = function(buf_num, severity)
  local diagnostics = nil
  diagnostics = diagnostic.get(buf_num, { severity = severity })

  local qf_items = diagnostic.toqflist(diagnostics)
  vim.fn.setqflist({}, ' ', { title = 'Diagnostics', items = qf_items })

  -- open quickfix by default
  vim.cmd[[copen]]
end


local on_attach = function(client, bufnr)
    -- Mappings.
    local map = function(mode, l, r, opts)
        opts = opts or {}
        opts.silent = true
        opts.buffer = bufnr
        keymap.set(mode, l, r, opts)
    end

    map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
    map("n", "<C-]>", vim.lsp.buf.definition)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "<C-k>", vim.lsp.buf.signature_help)
    map("n", "<space>rn", vim.lsp.buf.rename, { desc = "varialbe rename" })
    map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
    map("n", "[d", diagnostic.goto_prev, { desc = "previous diagnostic" })
    map("n", "]d", diagnostic.goto_next, { desc = "next diagnostic" })
    -- this puts diagnostics from opened files to quickfix
    map("n", "<space>qw", diagnostic.setqflist, { desc = "put window diagnostics to qf" })
    -- this puts diagnostics from current buffer to quickfix
    map("n", "<space>qb", function() set_qflist(bufnr) end, { desc = "put buffer diagnostics to qf" })
    map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
    map("n", "<space>wl", function()
        inspect(vim.lsp.buf.list_workspace_folders())
    end, { desc = "list workspace folder" })

    -- Set some key bindings conditional on server capabilities
    if client.server_capabilities.documentFormattingProvider then
        map("n", "<space>f", vim.lsp.buf.format, { desc = "format code" })
    end
end

-- local on_attach = function(_, _)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--     vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
-- end

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
                -- use ruff as linter AND formatter
                ruff = {
                    enable = true,
                    extendSelect = { "ALL" },
                    format = { "ALL" },
                },

                -- formatter options
                black = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },

                -- linter options
                pylint = { enabled = false, executable = "pylint" },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },

                -- type checker
                pylsp_mypy = { enabled = true },

                -- auto-completion options
                jedi_completion = { fuzzy = true },

                -- import sorting
                pyls_isort = { enabled = true },

                -- old config
                -- pycodestyle = {
                --     ignore = {"E741"},
                --     maxLineLength = 100,
                --     hangClosing = false,
                -- },
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

-- require('lspconfig').mypy.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }

-- require('lspconfig').ruff.setup{
--     on_attach = on_attach,
--     capabilities = capabilities,
-- }


-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = '❌',  texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = '⚠️', texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = 'ℹ️', texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = '💡', texthl = "DiagnosticSignHint" })

-- global config for diagnostic
diagnostic.config {
  underline = false,
  virtual_text = false,
  signs = true,
  severity_sort = true,
}
