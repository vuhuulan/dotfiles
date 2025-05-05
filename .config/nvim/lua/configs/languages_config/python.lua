return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "ruff", "basedpyright" },
        }
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["*"] = { "trim_whitespace", "trim_newlines" },
                python = { "ruff_format" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        -- opts = {
        --     servers = {
        --         basedpyright = {
        --             -- settings = {
        --             --     basedpyright = {
        --             --         typeCheckingMode = "standard"
        --             --     }
        --             -- }
        --         }
        --     },
        --     setup = {},
        -- }
        config = function()
            require("lspconfig").basedpyright.setup {
                settings = {
                    basedpyright = { typeCheckingMode = "standard" }
                }
            }
        end,
    },
}
