return {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = {
        editor = { tooltip = 'Neovim' },
        display = {
            swap_fields = true,
        },
        text = {
            default = "",
            viewing = false,
            editing = false,
            file_browser = false,
            plugin_manager = false,
            lsp_manager = false,
            docs = false,
            vcs = false,
            notes = false,
            workspace = false,
        },
    },
}
