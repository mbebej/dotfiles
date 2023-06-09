local utils = require("utils")
local termcodes = utils.termcodes
local nmap = utils.nmap
local vmap = utils.vmap
local imap = utils.imap
local xmap = utils.xmap
local omap = utils.omap
local nnoremap = utils.nnoremap
local inoremap = utils.inoremap
local vnoremap = utils.vnoremap

-- ----------------
-- Install Vim-Plug
-- ----------------
local vimplug_path = vim.fn.expand('~/.config/nvim/autoload/plug.vim')
local curl_executable = vim.fn.expand('curl')

if vim.fn.filereadable(vimplug_path) == 0 and vim.fn.executable(curl_executable) == 1 then
	print('Installing Vim-Plug')
	os.execute(curl_executable .. ' -fLo ' .. vimplug_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

	vim.api.nvim_command([[
		autocmd VimEnter * PlugInstall
	]])
elseif vim.fn.executable(curl_executable) == 0 then
	vim.cmd ':q!'
end

-- ---------------
-- Install Plugins
-- ---------------
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
	Plug('puremourning/vimspector')
	Plug('jiangmiao/auto-pairs')
	Plug('neoclide/coc.nvim', {branch = 'release'})
	Plug('editorconfig/editorconfig-vim')
	Plug('airblade/vim-gitgutter')
	Plug('glepnir/galaxyline.nvim' , {branch = 'main'})
	Plug('junegunn/fzf')
	Plug('EdenEast/nightfox.nvim')
	-- language specific plugins
	Plug('OmniSharp/omnisharp-vim')
	Plug('jelera/vim-javascript-syntax')
	Plug('leafOfTree/vim-svelte-plugin')
	Plug('leafgarland/typescript-vim')
	Plug('dense-analysis/ale')
	Plug('rust-lang/rust.vim')
	Plug('neovim/nvim-lspconfig')
vim.call('plug#end')

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

-- dotnet settings
vim.g.OmniSharp_server_use_net6 = 1

-- rust settings
vim.opt.completeopt = 'menu,menuone,preview,noselect,noinsert'
vim.g.ale_completion_enabled = 1
vim.g.ale_completion_autoimport = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = { rust = {'rustfmt', 'trim_whitespace', 'remove_trailing_lines'} }
vim.g.LanguageClient_serverCommands = { rust = {'rust-analyzer'}, dotnet = {'omnisharp-roslyn'} }

vim.g.coc_global_extensions = { 'coc-rust-analyzer', 'coc-omnisharp', 'coc-tsserver' }

-- viminspector
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'	-- use visual studio like keybindings

-- gitgutter
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_highlight_linenrs = 1

-- theme

-- -------------------------
-- Window Splitting/Movement
-- -------------------------
vim.cmd([[
function! WinMove(key)
    let t:curwin = winnr()
    exec 'wincmd '.a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec 'wincmd '.a:key
    endif
endfunction
]])

nmap('<C-h>', ':call WinMove(\'h\')<CR>', {noremap = true, silent = true})
nmap('<C-j>', ':call WinMove(\'j\')<CR>', {noremap = true, silent = true})
nmap('<C-k>', ':call WinMove(\'k\')<CR>', {noremap = true, silent = true})
nmap('<C-l>', ':call WinMove(\'l\')<CR>', {noremap = true, silent = true})
nmap('<A-Up>', ':move .-2<CR>', {noremap = true, silent = true})
nmap('<A-Down>', ':move .+1<CR>', {noremap = true, silent = true})
nmap('<F4>', ':VimspectorReset<CR>', {noremap = true, silent = true})
nmap('<C-i>', ':OmniSharpFindImplementations<CR>', {noremap = false, silent = true})
nmap('<D-d>', ':ALEGoToDefinition<CR>', {noremap = true})

vim.cmd [[ highlight link CocFloating markdown ]]

require'lspconfig'.rust_analyzer.setup({})
require('plugins.galaxyline')
require('plugins.nightfox2')
