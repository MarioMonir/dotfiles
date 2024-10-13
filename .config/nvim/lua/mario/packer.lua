-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Fuzzy Finder
	use({ "junegunn/fzf", run = "./install --bin" })
	use({ "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } })

	-- ColorScheme Theme
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_dark_colorblind")
		end,
	})

	-- Neovim Tree-Sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Undo Tree
	use({ "mbbill/undotree" })

	-- Git
	use({ "tpope/vim-fugitive" })

	-- Git Signs
	use({ "lewis6991/gitsigns.nvim" })

	-- LSP
	use({ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })

	-- LSP Package Manager
	use({ "williamboman/mason.nvim" })

	-- AutoFormat
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
end)
