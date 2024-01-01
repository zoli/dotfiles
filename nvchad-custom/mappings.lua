---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>/"] = "",
  },

  v = {
    ["<leader>/"] = "",
    ["<leader>ff"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },

    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },

    ["<leader>fw"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "Live grep",
    },

    ["<C-M-p>"] = { "<cmd> SessionManager load_session<CR>", "Load session" },
  },

  v = {
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- more keybinds!

return M
