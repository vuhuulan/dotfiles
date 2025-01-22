return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        -- text editing
        require("mini.ai").setup()
        require("mini.surround").setup()
        -- workflow
        require("mini.basics").setup()
        require("mini.bracketed").setup()
        require("mini.git").setup()
        require("mini.diff").setup()
        -- appearance
        require("mini.statusline").setup()
        require("mini.icons").setup()
    end,
}
