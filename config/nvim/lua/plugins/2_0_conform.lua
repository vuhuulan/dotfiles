return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "ruff" },
        },
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
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)
        end
    },
}
