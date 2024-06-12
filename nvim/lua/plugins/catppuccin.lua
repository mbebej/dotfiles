require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- disables setting the background color.
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
    },
    default_integrations = true,
    integrations = {
        cmp = true,
        dap = true,
        gitgutter = true,
        treesitter = true,
    },
})

vim.cmd.colorscheme "catppuccin"
