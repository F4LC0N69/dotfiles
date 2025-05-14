return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
      end
  }
}
