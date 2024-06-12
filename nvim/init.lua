local utils = require("utils")
local nmap = utils.nmap
--local vmap = utils.vmap
--local nnoremap = utils.nnoremap
--local inoremap = utils.inoremap
--local vnoremap = utils.vnoremap

-- ------------
-- Install Lazy
-- ------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------
-- Install Plugins
-- ---------------

local plugins = {
    {'windwp/nvim-autopairs', event = 'InsertEnter', config = true},
    {'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"},
    {'glepnir/galaxyline.nvim', branch = "main"},
    {'catppuccin/nvim', name = "catppuccin", priority = 1000},
    {'airblade/vim-gitgutter'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'rust-lang/rust.vim'},
    {'mrcjkb/rustaceanvim', version = '^4', lazy = false, ft = {rust}},
    {'mfussenegger/nvim-dap'},
    {'nvim-neotest/nvim-nio'},
    {'rcarriga/nvim-dap-ui'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
}

-- -----------------
-- Configure Plugins
-- -----------------

require("lazy").setup(plugins, {})
require("plugins.treesitter")
require("plugins.catppuccin")
require("plugins.galaxyline")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("plugins.cmp")
require("plugins.lsp")
require("plugins.rust")
require("plugins.autopairs")

-- --------
-- Settings
-- --------
vim.opt.number = true					-- turn on line numbers
vim.opt.wrap = false					-- turn off line wrap
vim.opt.visualbell = true				-- screen will flash as opposed to auditory bell
vim.opt.incsearch = true				-- enable incremental search
vim.opt.wildmode = {'list', 'longest'}	-- autocomplete files like the shell
vim.opt.termguicolors = true

-- tab control
vim.opt.smarttab = true 				-- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
vim.opt.tabstop = 4 					-- the width of tabs
vim.opt.shiftwidth = 4 					-- number of spaces to use for indent and unindent
vim.opt.shiftround = true 				-- round indent to a multiple of 'shiftwidth'

-- rust settings
vim.opt.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.g.rustfmt_autosave = 1
vim.g.rust_clip_command = 'xclip -selection clipboard'

-- gitgutter
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_highlight_linenrs = 1

nmap('<A-Up>', ':move .-2<CR>', {noremap = true, silent = true})
nmap('<A-Down>', ':move .+1<CR>', {noremap = true, silent = true})
