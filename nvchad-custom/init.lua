-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.relativenumber = true

vim.opt.expandtab = false
vim.opt.shiftwidth = 8
vim.opt.smartindent = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 8

vim.opt.guifont = { "FiraCode Nerd Font", ":h14" }
