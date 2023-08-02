vim.opt.showmode = false        --no mode in cmd line bc statusline redundancy

require('lualine').setup{
    options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
    },
}
