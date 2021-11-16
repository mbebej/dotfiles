local nightfox = require('nightfox')

nightfox.setup({
	fox = 'nordfox',
	styles = {
		comments = 'italic' -- change style of comments to be italic
	},
	inverse = {
		match_paren = true, -- inverse the highlighting of match_parens
	},
	colors = {
		bg = '#111111',
	},
	hlgroups = {
		LineNr = { bg = '#202328', fg = 'grey' }
	}
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()
