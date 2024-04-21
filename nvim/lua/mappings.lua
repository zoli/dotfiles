require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>/", "")
map("v", "<leader>/", "")
map("v", "<leader>ff", "")

map(
  "v",
  "<C-/>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle comment" }
)

map("n", "<C-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Live grep" })
map("n", "<leader>fr", function()
  require("telescope").extensions.aerial.aerial()
end, { desc = "Show symbols" })
map("n", "<C-M-p>", "<cmd> SessionManager load_session<CR>", { desc = "Load session" })
