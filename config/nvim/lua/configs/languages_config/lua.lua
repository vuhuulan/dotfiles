return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "lua-language-server" },
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        require("lspconfig").lua_ls.setup {},
    },
}
