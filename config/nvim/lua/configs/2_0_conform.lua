return {
    {
        "stevearc/conform.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            dependencies = { "williamboman/mason.nvim" },
            opts = {
                ensure_installed = { "ruff", "markdownlint-cli2" },
            },
        },
        opts = {
            formatters_by_ft = {
                ["*"] = { "trim_whitespace", "trim_newlines" },
                python = { "ruff_format" },
                markdown = { "markdownlint-cli2" }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
