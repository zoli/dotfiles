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
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        "rust-analyzer",

        "gopls",
        "goimports",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "c",
        "markdown",
        "markdown_inline",
        "hyprlang",
        "rust",
        "go",
        "gomod",
        "gosum",
        "bash",
        "fish",
        "gitcommit",
        "gitignore",
        "json",
        "make",
        "regex",
        "toml",
        "yaml",
      },
    },
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
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local options = require "configs.telescope"

      conf.extensions_list = options.extensions_list
      conf.defaults = options.defaults

      return conf
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "stevearc/dressing.nvim",
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
