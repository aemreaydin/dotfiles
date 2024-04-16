local M = {
	"folke/twilight.nvim",
}

M.config = function()
	require("twilight").setup({
		dimming = {
			alpha = 0.25,
			color = { "Normal", "#ffffff" },
			term_bg = "#000000",
			inactive = false,
		},
		context = 15,
		treesitter = true,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
		},
	})
end

return M
