local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = {buffer = bufnr, remap = false}
    lsp_zero.default_keymaps({buffer = bufnr})
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
    --    https://github.com/williamboman/mason-lspconfig.nvim
    ensure_installed = {"lua_ls","tsserver"},
    handlers = {
        lsp_zero.default_setup,
    },

})

lsp_zero.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

