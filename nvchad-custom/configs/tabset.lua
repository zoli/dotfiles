local lspconfig = require("tabset")

lspconfig.setup({
	defaults = {
		tabwidth = 8,
		expandtab = false,
	},
	languages = {
		rust = {
			tabwidth = 2,
			expandtab = true,
		},
		{
			filetypes = { "javascript", "typescript", "vue" },
			config = {
				tabwidth = 4,
			},
		},
		{
			filetypes = { "dart", "lua", "json", "yaml", "toml" },
			config = {
				tabwidth = 2,
				expandtab = true,
			},
		},
	},
})
