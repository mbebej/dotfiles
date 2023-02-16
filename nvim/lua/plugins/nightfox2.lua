local nightfox = require('nightfox')

nightfox.setup({
	options = {
		styles = {
			comments = "italic",     
		},
		inverse = {
			match_paren = true, -- inverse the highlighting of match_parens
		},
		transparent = true,
	},
})

vim.cmd([[silent! colorscheme nightfox]])
