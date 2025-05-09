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
            viewing = "Viewing a file",
            editing = "Editing a file",
            file_browser = false,
            plugin_manager = false,
            lsp_manager = false,
            docs = "Writing docs",
            vcs = false,
            notes = false,
            workspace = false,
        },
    },
}
