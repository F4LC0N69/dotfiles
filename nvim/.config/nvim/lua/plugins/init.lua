return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5", -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   config = function()
  --     local mason_registry = require "mason-registry"
  --     local codelldb = mason_registry.get_package "codelldb"
  --     local extension_path = codelldb:get_install_path() .. "/extension/"
  --     local codelldb_path = extension_path .. "adapter/codelldb"
  --     local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
  --     local cfg = require "rustaceanvim.config"
  --
  --     vim.g.rustaceanvim = {
  --       dap = {
  --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  --       },
  --     }
  --   end,
  -- },
  --
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require "configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
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
        "c",
        "javascript",
        "typescript",
        "rust",
        "zig",
      },
    },
  },
}
