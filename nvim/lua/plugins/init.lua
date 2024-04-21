return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.treesitter"
    end,
    dependencies = { "luckasRanarison/tree-sitter-hyprlang" },
  },

  {
    "folke/neoconf.nvim",
    lazy = false,
    config = function()
      require("neoconf").setup {}
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require "configs.nvim-tree"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require "configs.telescope"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      'stevearc/dressing.nvim',
    },
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },

  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      local config = require "session_manager.config"
      require("session_manager").setup {
        autoload_mode = config.AutoloadMode.CurrentDir,
        autosave_only_in_session = true,
      }
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {
      multiline_threshold = 1,
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    version = "*",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "nmac427/guess-indent.nvim",
    lazy = false,
    config = function()
      require("guess-indent").setup()
    end,
    dependencies = {
      "FotiadisM/tabset.nvim",
      config = function()
        require "configs.tabset"
      end,
    },
  },
}
