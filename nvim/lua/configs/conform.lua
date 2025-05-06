local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    rust = { "rustfmt" },
    typescript = { "prettier" },
    vue = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    typescriptreact = { "prettier" },
    ["*"] = { "trim_whitespace" },
  },
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 750,
      lsp_fallback = true,
    }
  end,
}

require("conform").setup(options)
