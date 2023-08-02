require'nvim-treesitter.configs'.setup{
    ensure_installed = { "python", "lua", "vim", "vimdoc" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
