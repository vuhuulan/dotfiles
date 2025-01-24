return {
    {
        "folke/tokyonight.nvim",
        -- "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        -- opts = { contrast = "hard" },
        config = function()
            vim.cmd([[colorscheme tokyonight-storm]])
            -- vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
    }
}
