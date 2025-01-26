return {
    {
        "stevearc/conform.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "williamboman/mason.nvim" },
            opts = {
                ensure_installed = { "ruff" },
            },
        },
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
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = {
                    "williamboman/mason.nvim",
                },
                opts = {
                    ensure_installed = { "basedpyright" },
                },
            },
        },
        config = function()
            require("lspconfig").basedpyright.setup {
                settings = {
                    basedpyright = { typeCheckingMode = "standard" }
                }
            }
        end,
    },
}
