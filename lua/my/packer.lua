local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup {
    function(use)
        -- :help packer.use() -- for help
        use 'wbthomason/packer.nvim'
        use {
            'michalbachowski/vim-wombat256mod',
            config = function()
                vim.cmd [[colorscheme wombat256mod]]
                vim.cmd [[hi CursorLineNr cterm=bold]]    -- current line number
                vim.cmd [[hi ColorColumn term=reverse ctermbg=236]]    -- colorcolumn
            end
        }

        use {  -- curently used for statusline but may be used for tabline too
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons' },
            event = "UiEnter",
            config = function() require('my.plugin_configs.lualine') end,
        }

        use({  -- curently used for tabline but may be used for statusline too
            "rebelot/heirline.nvim",
            requires = { 'nvim-tree/nvim-web-devicons' },
            event = "UiEnter",
            config = function() require('my.plugin_configs.heirline') end,
        })

        use {
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons' },
            config = function() require('my.plugin_configs.nvim-tree') end,
        }

        -- use 'dcampos/nvim-snippy'  -- alternative to luasnip
        -- use 'honza/vim-snippets'  -- alternative to luasnip

        use {
            "williamboman/mason.nvim",
            config = function() require('my.plugin_configs.mason') end,
        }
        use {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }

        -- use {
        --   'nvim-treesitter/nvim-treesitter',
        --   -- config = function() vim.cmd [[TSUpdate]] end
        -- }

        use {
            'hrsh7th/nvim-cmp',
            config = function() require('my.plugin_configs.cmp') end,
        }
        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
        -- use 'dcampos/cmp-snippy'

        use 'hrsh7th/cmp-nvim-lsp-signature-help'

        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip'

        use {
            'numToStr/Comment.nvim',
            config = function() require('my.plugin_configs.Comment') end,
        }

        -- use {'kevinhwang91/nvim-bqf'}

        use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} },
          config = function() require('my.plugin_configs.telescope') end,
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
         compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
    }
}
