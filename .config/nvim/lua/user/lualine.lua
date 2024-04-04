local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
	require("lualine").setup({
		options = {
			theme = "ayu_dark",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
