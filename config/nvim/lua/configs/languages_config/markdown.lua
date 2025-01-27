return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "markdownlint-cli2" },
        }
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                ["*"] = { "trim_whitespace", "trim_newlines" },
                markdown = { "markdownlint-cli2" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
