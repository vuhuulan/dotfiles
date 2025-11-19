return {
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
            vim.lsp.enable('basedpyright')
            vim.lsp.config('basedpyright', {
                settings = {
                    basedpyright = { typeCheckingMode = "standard" }
                }
            })
            vim.lsp.enable('lua_ls')
        end,
    },
}
