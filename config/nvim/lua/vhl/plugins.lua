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

    paq(packages)
    paq.install()
end

bootstrap_paq {
    "savq/paq-nvim",
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- the line
    'nvim-lualine/lualine.nvim',

    -- colorscheme
    'ellisonleao/gruvbox.nvim',

    -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- completion
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',

    -- utils
    'nvim-lua/plenary.nvim',                -- dependency and telescope
    { 'nvim-telescope/telescope.nvim' },
    'jpalardy/vim-slime',                   -- sending text to target, mostly used with repl
    'christoomey/vim-tmux-navigator',       -- tmux-vim nav
    'tpope/vim-unimpaired',                 -- bunch of tpope utils, very useful
    'tpope/vim-commentary',
    'tpope/vim-surround',
}
