return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            ["*"] = { "trim_whitespace", "trim_newlines" },
            markdown = { "markdownlint-cli2" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
