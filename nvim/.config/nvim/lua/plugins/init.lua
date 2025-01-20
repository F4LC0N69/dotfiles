return {
  {
    "stevearc/conform.nvim",
     event = 'BufWritePre', -- uncomment for format on save
      opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
   -- tag = "*",
  },

  {
    "williamboman/mason.nvim",
  },

  {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
  },
  {
    'hrsh7th/cmp-buffer',
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },


}
