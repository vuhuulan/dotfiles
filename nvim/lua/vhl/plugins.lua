local function clone_paq()
    local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
    local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
    if not is_installed then
        vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path }
        return true
    end
end

local function bootstrap_paq(packages)
    local first_install = clone_paq()
    vim.cmd.packadd("paq-nvim")
    local paq = require("paq")
    if first_install then
        vim.notify("Installing plugins... If prompted, hit Enter to continue.")
    end

    -- Read and install packages
    paq(packages)
    paq.install()
end

bootstrap_paq {
    "savq/paq-nvim",
    { 'nvim-treesitter/nvim-treesitter', run = function() vim.cmd 'TSUpdate' end },  

    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',

    'ellisonleao/gruvbox.nvim',

    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
} 
