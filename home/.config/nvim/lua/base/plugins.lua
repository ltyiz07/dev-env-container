local fn = vim.fn

-- ensure that packer is installed

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

--- startup and add configure plugins
return packer.startup(function(use)
    -- use 'neovim/nvim-lspconfig'
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'mbbill/undotree'
    use 'preservim/nerdtree'

    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    
    --[[
    --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use ({
        'savq/melange-nvim',
        commit = '78af754ad22828ea3558e2990326b8aa39730918'
    })
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use { 'ggandor/leap.nvim' }
    use { 'mhartington/formatter.nvim' }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    --]]
    
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
