-- EXAMPLE
local lsp_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local on_attach = function(client, bufnr)
  lsp_on_attach(client, bufnr)

  vim.keymap.set("n", "<leader>d", "<Nop>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>Dw", "<Nop>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>Db", "<Nop>", { buffer = bufnr })
  vim.keymap.set("n", "gpd", "<Nop>", { buffer = bufnr })
  vim.keymap.set("n", "gpD", "<Nop>", { buffer = bufnr })
  vim.keymap.set("n", "gr", "<Nop>", { buffer = bufnr })

  vim.keymap.set("n", "<leader>d", "<cmd> Lspsaga show_line_diagnostics <cr>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>Dw", "<cmd> Lspsaga show_workspace_diagnostics <cr>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>Db", "<cmd> Lspsaga show_buf_diagnostics <cr>", { buffer = bufnr })
  vim.keymap.set("n", "gpd", "<cmd> Lspsaga peek_definition <cr>", { buffer = bufnr })
  vim.keymap.set("n", "gpD", "<cmd> Lspsaga peek_type_definition <cr>", { buffer = bufnr })
  vim.keymap.set("n", "gr", "<cmd> Telescope lsp_references <cr>", { buffer = bufnr })
end

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "gopls",
  "rust_analyzer",
  "dartls",
  "emmet_language_server",
  "tailwindcss",
  "solidity_ls_nomicfoundation",
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue", "typescriptreact" },
      },
    },
  },
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "typescript",
    "vue",
    "typescriptreact",
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
