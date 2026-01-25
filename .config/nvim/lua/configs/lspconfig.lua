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

            vim.lsp.config('harper_ls', {
              settings = {
                ["harper-ls"] = {
                  userDictPath = "~/dict.txt"
                }
              },
            })
            vim.lsp.enable('harper_ls')

            vim.lsp.enable('texlab')
        end,
    },
}
