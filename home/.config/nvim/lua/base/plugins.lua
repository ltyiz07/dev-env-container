local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"mbbill/undotree",
	"preservim/nerdtree",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"rust",
					"typescript",
					"java",
					"python",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippets plugin
	{ "stevearc/conform.nvim", event = { "BufReadPre", "BufNewFile" } },

	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
	"ggandor/leap.nvim",
})
