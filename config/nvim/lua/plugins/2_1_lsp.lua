return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                dependencies = {
                    "williamboman/mason.nvim",
                },
                opts = {
                    ensure_installed = { "pyright", "basedpyright" },
                },
            },
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
        config = function()
            require("lspconfig").lua_ls.setup {}
            -- require("lspconfig").pyright.setup {}
            require("lspconfig").basedpyright.setup {}
        end,
    },
}
