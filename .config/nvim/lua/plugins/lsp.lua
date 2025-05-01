return { 
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'bashls',
                    'clangd',
                    'cssls',
                    'gopls',
                    'html',
                    'jsonls',
                    --'tsserver',
                    'lua_ls',
                    'marksman',
                    'jedi_language_server',
                    'yamlls',
                }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            vim.keymap.set('n', '<leader>?', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>.?', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>..', vim.lsp.buf.code_action, {})
        end
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup({
                vim.keymap.set('n', '<Leader>??', require("lsp_lines").toggle)
            })
        end,
    }
}
