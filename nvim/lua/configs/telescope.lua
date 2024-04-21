local select_one_or_multi = function(prompt_bufnr)
  local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require("telescope.actions").close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        vim.cmd(string.format("%s %s", "edit", j.path))
      end
    end
  else
    require("telescope.actions").select_default(prompt_bufnr)
  end
end

local action_layout = require "telescope.actions.layout"
local options = {
  extensions_list = { "themes", "terms", "fzf", "ui-select", "live_grep_args", "aerial" },
  defaults = {
    path_display = {
      truncate = 3,
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.45,
        results_width = 0.8,
      },
      preview_cutoff = 90,
    },
    border = true,
    preview = {
      hide_on_startup = true,
    },
    mappings = {
      n = {
        ["<M-p>"] = action_layout.toggle_preview,
      },
      i = {
        ["<M-p>"] = action_layout.toggle_preview,
        ["<CR>"] = select_one_or_multi,
      },
    },
  },
}

require("telescope").setup(options)
