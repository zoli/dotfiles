local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"gopls",
	"rust_analyzer",
	"dartls",
	"emmet_language_server",
	"tailwindcss",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig["volar"].setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	on_attach = on_attach,
	capabilities = capabilities,
})

--
-- lspconfig.pyright.setup { blabla}
