return
{
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function ()
      require("nvim-silicon").setup({
        font = "Comic Sans MS=18",
        theme = "/Users/sakshyamrijal/.config/nvim/lua/plugins/Catppuccin Mocha.tmTheme",
        output = function ()
          local timestamp = os.date("%Y-%m-%d_%H-%m-%S")
          return string.format("/Users/sakshyamrijal/Pictures/Codesnaps/snap_%s.png", timestamp)
        end,
        background = "#1e1e2e",
        window_title = function ()
          return vim.fn.fnamemodify(
            vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t"
          )
        end
      })
    end
}
