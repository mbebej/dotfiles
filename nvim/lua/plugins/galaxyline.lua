local gl = require('galaxyline')
local section = gl.section
local colors = require('colors')
local condition = require("galaxyline.condition")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require('galaxyline.provider_fileinfo')

local mode_text = {
	n = 'normal',
	niI = 'normal (insert)',
	niR = 'normal (replace)',
	niV = 'normal (visual)',
	i = 'insert',
	v = 'visual',
	V = 'visual',
	s = 'select',
	S = 'select',
	ic = 'insert',
	ix = 'insert',
	R = 'replace',
	Rc = 'replace',
	Rv = 'replace',
	Rx = 'replace',
	c = 'command',
	cv = 'ex',
	ce = 'ex',
	no = 'operator-pending',
	nov = 'operator-pending',
	noV = 'operator-pending',
	noCTRLV = 'operator-pending',
	['^V'] = 'visual(block)',
	['^S'] = 'select(block)',
	r = 'hit enter',
	rm = '-- more --',
	['r?'] = 'confirm?',
	['!'] = 'shell'
}

local mode_color = {
	c = colors.magenta,
	["!"] = colors.red,
	i = colors.green,
	ic = colors.yellow,
	ix = colors.yellow,
	n = colors.blue,
	no = colors.blue,
	nov = colors.blue,
	noV = colors.blue,
	r = colors.cyan,
	rm = colors.cyan,
	["r?"] = colors.cyan,
	R = colors.purple,
	Rv = colors.purple,
	s = colors.orange,
	S = colors.orange,
	[""] = colors.orange,
	t = colors.purple,
	v = colors.red,
	V = colors.red,
	[""] = colors.red
}

local function file_readonly()
	if vim.bo.filetype == 'help' then return '' end
	if vim.bo.readonly == true then return '*' end
	return ''
end

local function get_file_name()
	local file = vim.fn.expand('%:t')
	if vim.fn.empty(file) == 1 then return '' end
	if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
	if vim.bo.modifiable then
		if vim.bo.modified then return file .. '~' end
	end
	return file .. ' '
end

-- left
section.left[0] = {
	ModeNum = {
		highlight = {colors.black},
		provider = function()
			vim.api.nvim_command("hi GalaxyModeNum guibg=" .. mode_color[vim.fn.mode()])
			return '  ' .. mode_text[vim.fn.mode()] .. ' ' 
		end,
		separator = ' ',
		separator_highlight = {colors.fg, colors.bg}
	}
}

section.left[1] = {
	FileName = {
		highlight = {colors.fg, colors.bg},
		provider = get_file_name,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}

section.left[2] = {
	LineColumn = {
		highlight = {colors.fg, colors.bg},
		provider = function()
			local line = vim.fn.line('.')
			local column = vim.fn.col('.')
			return string.format("%d:%d", line, column)
		end,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}

-- right
section.right[0] = {
	FileEncode = {
		highlight = {colors.fg, colors.bg},
		provider = function()
			return vim.bo.fileencoding
		end,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}

section.right[1] = {
	FileFormat = {
		highlight = {colors.fg, colors.bg},
		provider = function()
			return vim.bo.fileformat
		end,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}

section.right[2] = {
	FileSize = {
		highlight = {colors.fg, colors.bg},
		--provider = function()
		--	return vim.fn.getfsize(vim.fn.expand('%:p'))
		--end,
		provider = fileinfo.get_file_size,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}

section.right[3] = {
	Git = {
		highlight = {colors.fg, colors.bg},
		condition = condition.check_git_workspace,
		provider = function()
			local branch = vcs.get_git_branch()
			if (branch == nil) then
				branch = '?'
			end
			local modified = vcs.diff_modified()
			if (modified == nil) then
				return 'b:' .. branch .. ' '
			end
			return 'b:' .. branch .. '~' .. ' '
		end,
		separator = ' | ',
		separator_highlight = {colors.black, colors.bg}
	}
}
