local tabset = require("tabset")

tabset.setup({
	defaults = {
		tabwidth = 8,
		expandtab = false,
	},
	languages = {
		{
			filetypes = { "html", "javascript", "typescript", "vue", "css", "scss", "yuck" },
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
