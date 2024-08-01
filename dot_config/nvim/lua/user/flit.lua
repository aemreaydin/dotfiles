local M = {
	"ggandor/flit.nvim",
	dependencies = {
		"ggandor/leap.nvim",
		"tpope/vim-repeat",
	},
}

M.config = function()
	require("flit").setup({
		keys = { f = "f", F = "F", t = "t", T = "T" },
		labeled_modes = "v",
		multiline = true,
		opts = {},
	})
end

return M
