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
	-- language specific plugins
	Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
	Plug('jelera/vim-javascript-syntax')
	Plug('leafOfTree/vim-svelte-plugin')
	Plug('leafgarland/typescript-vim')
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

-- go settings
vim.g.go_diagnostics_enabled = 0 		-- disable diagnostics this will be taken care of by coc
vim.g.go_fmt_command = "goimports"		-- run goimports on file save
-- go additional syntax highlighting
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1

-- viminspector
vim.g.vimspector_install_gadgets = { 'vscode-go' }	-- install vscode-go debugging
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'	-- use visual studio like keybindings

--gitgutter
vim.g.gitgutter_set_sign_backgrounds = 1
vim.g.gitgutter_highlight_linenrs = 1

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

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
]])

vim.api.nvim_set_keymap('n', '<A-Up>', ':move .-2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-Down>', ':move .+1<CR>', {noremap = true})

-- --------------
-- Go keybindings
-- --------------
vim.cmd [[
	autocmd BufEnter *.go nmap <leader>b  <Plug>(go-build)
	autocmd BufEnter *.go nmap <leader>r  <Plug>(go-run)
	autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
	autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
	autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
	autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
	autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
	autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
	nmap <leader>cr <Plug>(coc-references)
	nmap <C-a> <C-o>
	nmap <C-d> <Plug>(coc-definition)
]]

nmap('<F4>', '<Plug>VimspectorReset')

vim.cmd [[ highlight link CocFloating markdown ]]

require('plugins.galaxyline')
