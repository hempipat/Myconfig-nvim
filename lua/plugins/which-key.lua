return {
  'folke/which-key.nvim',
  -- document existing key chains
  event = "VeryLazy",
  config = function ()
    require('which-key').register({
	["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "[E]xplorer" }
    })
  end,
}
