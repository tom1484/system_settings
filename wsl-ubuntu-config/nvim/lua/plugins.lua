return {
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- vscode colorscheme
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	},
	-- 'nvim-treesitter/playground',
	-- harpoon navigator
	-- 'theprimeagen/harpoon',
	-- undotree
	{
		"mbbill/undotree",
		lazy = false,
	},
	-- vim-fugitive
	"tpope/vim-fugitive",
	-- Comment
	"numToStr/Comment.nvim",
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		-- lazy = true,
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	-- null-ls
	"jose-elias-alvarez/null-ls.nvim",
	-- 'MunifTanjim/prettier.nvim',
	-- 'mhartington/formatter.nvim',
	-- nvim-tmux-navigation
	"alexghergh/nvim-tmux-navigation",
	-- bufferline
	-- {
	--     "akinsho/bufferline.nvim",
	--     -- dependencies = "nvim-tree/nvim-web-devicons",
	-- },
	-- tabline
	-- {
	-- 	"kdheepak/tabline.nvim",
	-- 	-- dependencies = { { "hoob3rt/lualine.nvim", opt = true } },
	-- },
	-- JABS
	"matbme/JABS.nvim",
	-- auto-pair
	"windwp/nvim-autopairs",
	-- transparent
	"xiyaowong/nvim-transparent",
	-- tokyonight
	"folke/tokyonight.nvim",
	-- sad
	{
		"ray-x/sad.nvim",
		dependencies = {
			{
				"ray-x/guihua.lua",
				build = "cd lua/fzy && make",
			},
		},
	},
	-- nvim-tree
	"nvim-tree/nvim-tree.lua",
}
