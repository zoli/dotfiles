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

map({ "n", "v", "i" }, "<leader>x", function()
  local alt = vim.fn.bufnr "#"
  local alt_exists = vim.fn.buflisted(alt) == 1

  if alt_exists then
    vim.cmd "b#" -- Switch to alternate buffer
    -- Use bd! for terminal buffers
    if vim.bo[vim.fn.bufnr("#")].buftype == "terminal" then
      vim.cmd "bd! #"
    else
      vim.cmd "bd #" -- Delete the previous buffer (the one you just left)
    end
  else
    -- Get a list of all listed buffers
    local buffers = vim.fn.getbufinfo { buflisted = 1 }
    if #buffers > 1 then
      -- Find a buffer that's not the current one
      local current = vim.api.nvim_get_current_buf()
      for _, buf in ipairs(buffers) do
        if buf.bufnr ~= current then
          vim.cmd("buffer " .. buf.bufnr)
          break
        end
      end
      -- Use bd! for terminal buffers
      if vim.bo[vim.fn.bufnr("#")].buftype == "terminal" then
        vim.cmd "bd! #"
      else
        vim.cmd "bd #" -- Try to delete the previous buffer (may not exist, but safe)
      end
    else
      -- Only one buffer left, just close it
      -- Use bd! for terminal buffers
      if vim.bo.buftype == "terminal" then
        vim.cmd "bd!"
      else
        vim.cmd "bd"
      end
    end
  end
end, { noremap = true, silent = true })
