local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"folke/neoconf.nvim",
		lazy = false,
		config = function()
			require("neoconf").setup({})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = overrides.mason,
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		opts = overrides.telescope,
	},

	-- Install a plugin
	{
		"mg979/vim-visual-multi",
		branch = "master",
		lazy = false,
		init = function()
			vim.g.VM_maps = {
				["Find Under"] = "<C-d>",
				["Find Subword Under"] = "<C-d>",
			}
		end,
	},

	{
		"Shatur/neovim-session-manager",
		lazy = false,
		config = function()
			local config = require("session_manager.config")
			require("session_manager").setup({
				autoload_mode = config.AutoloadMode.CurrentDir,
				autosave_only_in_session = true,
			})
		end,
	},

	{
		"goolord/alpha-nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		opts = {
			multiline_threshold = 1,
		},
	},

	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"FotiadisM/tabset.nvim",
		lazy = false,
		config = function()
			require("custom.configs.tabset")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = overrides.conform,
	},

	{
		"stevearc/aerial.nvim",
		lazy = false,
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"ggandor/leap.nvim",
		lazy = false,
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},

	{
		"kylechui/nvim-surround",
		lazy = false,
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },
}

return plugins
