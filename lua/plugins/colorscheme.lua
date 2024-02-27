return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd("colorscheme catppuccin")
-- require("catppuccin").setup({})
  end,
}
