return {
    'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_list = {
            {
                path = '~/Documents/vimwiki/',
                --syntax = 'markdown',
                syntax = 'wiki',
                --ext = '.md'
                ext = '.wiki'
            }
        }
    end
}
