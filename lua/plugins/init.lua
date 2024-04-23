return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "rust-analyzer",
        "pyright",
        "typescript-language-server",
        "black",
        "rustfmt",
        "svelte-language-server",
        "shfmt",
        "bash-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "rust",
        "svelte",
        "typescript",
        "javascript",
        "rust",
        "bash",
      },
    },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
      mappings = {
        close = {
          normal = "q",
          insert = "<C-c><C-c>",
        },
      },

      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
