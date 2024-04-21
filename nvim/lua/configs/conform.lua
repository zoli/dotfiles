local options = {
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
