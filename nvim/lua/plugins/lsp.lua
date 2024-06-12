require("mason").setup({})
local lspconfig = require("mason-lspconfig")

lspconfig.setup({
    handlers = {
        function(server_name)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")[server_name].setup({
                capabilities = capabilities
            })
        end,
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n","gd",function() vim.lsp.buf.definition() end, opts) --go to definition
        vim.keymap.set('n','K',function() vim.lsp.buf.hover() end, opts) -- hover
        vim.keymap.set('n','<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts) --view workspace
        vim.keymap.set('n','<leader>vd', function() vim.diagnostic.open_foat() end, opts) --view diagnostic
        vim.keymap.set('n','[d',function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n',']d',function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n','<leader>vca', function() vim.lsp.buf.code_action() end, opts) --view code action
        vim.keymap.set('n','<leader>vrn', function() vim.lsp.buf.rename() end, opts) --rename variables
        vim.keymap.set('n','<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n','<leader>h', function() vim.lsp.buf.signature_help() end, opts)
    end
})

