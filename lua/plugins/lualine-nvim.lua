local config = function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			-- lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = {'filename'},
			lualine_x = {},
			lualine_y = { 'filetype', 'encoding', 'fileformat' },
			lualine_z = { '%l|%L','%l|%c' },
		},
		tabline = {},
	})
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  config = config

  -- See `:help lualine.txt`
  --[[ opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = { '', '', 'filetype' },
      lualine_z = { '%l|%L','%l|%c' },
    },
  }, ]]
}
