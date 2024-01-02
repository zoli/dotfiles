local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.conform = {
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports" },
		rust = { "rustfmt" },
		dart = { "dart_format" },
		typescript = { "deno_fmt" },
		vue = { "prettier" },
		-- javascript = { "deno_fmt" },
		json = { "deno_fmt" },
		["*"] = { "trim_whitespace" },
	},
	format_on_save = {
		timeout_ms = 750,
		lsp_fallback = true,
	},
	-- formatters = {
	--   deno_fmt = {
	--     prepend_args = { "--use-tabs" },
	--   },
	-- },
}

local select_one_or_multi = function(prompt_bufnr)
	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	local multi = picker:get_multi_selection()
	if not vim.tbl_isempty(multi) then
		require("telescope.actions").close(prompt_bufnr)
		for _, j in pairs(multi) do
			if j.path ~= nil then
				vim.cmd(string.format("%s %s", "edit", j.path))
			end
		end
	else
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

local action_layout = require("telescope.actions.layout")
M.telescope = {
	extensions_list = { "themes", "terms", "fzf", "ui-select", "live_grep_args" },
	defaults = {
		path_display = {
			truncate = 3,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.45,
				results_width = 0.8,
			},
			preview_cutoff = 90,
		},
		border = true,
		preview = {
			hide_on_startup = true,
		},
		mappings = {
			n = {
				["<M-p>"] = action_layout.toggle_preview,
			},
			i = {
				["<M-p>"] = action_layout.toggle_preview,
				["<CR>"] = select_one_or_multi,
			},
		},
	},
}

return M
