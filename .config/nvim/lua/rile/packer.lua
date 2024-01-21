vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --use 'ggandor/leap.nvim'
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }





    use {
        'numToStr/Comment.nvim',
        branch = "jsx",
        config = function()
            require('Comment').setup({
                ignore = '^$',
                -- toggler = {
                   -- line = '<leader>l',
                   -- block = '<leader>b',
                -- },
                -- opleader = {
                --     line = '<leader>c',
                --     block = '<leader>b',
                -- },

                -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end

    }



    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use { "github/copilot.vim"}
    use { "f-person/git-blame.nvim"}
    use { "rebelot/kanagawa.nvim"}
    use { "tpope/vim-fugitive"}
    use { "nvim-telescope/telescope-project.nvim" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use { "nvim-tree/nvim-web-devicons" }

    use { "jiangmiao/auto-pairs"}
    use {
        "askfiy/visual_studio_code",
        config = function()
            vim.cmd([[colorscheme visual_studio_code]])
        end,
    }




end)
