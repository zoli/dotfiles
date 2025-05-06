require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local telescope = require "telescope"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-p>", "<cmd> Telescope find_files <cr>", { desc = "Find files" })
map("n", "<leader>fw", function()
  telescope.extensions.live_grep_args.live_grep_args()
end, { desc = "Live grep" })
map("n", "<leader>fr", function()
  telescope.extensions.aerial.aerial()
end, { desc = "Show symbols" })

map("n", "<C-M-p>", "<cmd> SessionManager load_session <cr>", { desc = "Load session" })

map({ "n" }, "<LeftMouse>", "m'<LeftMouse>")

map("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
end)
map("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
end)

map("x", "p", "P")
map("x", "P", "p")
