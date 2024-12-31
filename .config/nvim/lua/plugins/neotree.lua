return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal left<CR>')
        vim.keymap.set('n', '<leader>nb', ':Neotree filesystem reveal bottom<CR>')
        require('neo-tree').setup({
            window = {
                width = 25,
                height = 10
            }
        })
    end
}
