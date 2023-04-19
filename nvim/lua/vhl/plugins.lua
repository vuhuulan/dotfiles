require "paq" {
    'savq/paq-nvim',            -- Let Paq manage itself

    --"neovim/nvim-lspconfig", 

    { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end },  

    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',

    'ellisonleao/gruvbox.nvim'
} 
