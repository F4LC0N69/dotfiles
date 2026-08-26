return {
  {
    'nvim-telescope/telescope.nvim',
    -- Remove 'tag = 0.1.8' so it uses current master with Neovim 0.11+ fixes
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = true,
          },
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
